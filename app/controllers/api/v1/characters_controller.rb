module Api
  module V1
    class CharactersController < ApplicationController
      before_action :set_slug, only: [:show]

      def show
        @character = Character.find_by(slug: @slug)
        if @character.nil? || @character&.privacy?
          render json: { message: 'Not found' }, status: :not_found
        elsif @character.privacy?
          render json: { message: 'Forbidden' }, status: :forbidden
        else
          render json: @character, serializer: CharacterSerializer, status: :ok
        end
      end

      def create
        @character = Character.new(character_params)
        @character.user = current_user if current_user.present?
        if @character.save
          render json: @character, serializer: CharacterSerializer, status: :created
        else
          render json: { errors: @character.errors }, status: :not_found
        end
      end

      private

      def set_slug
        @slug = params[:slug] || character_params[:slug]
        @slug = @slug.downcase.strip.gsub(/[^0-9A-Za-z-]/, '')
        @slug = I18n.transliterate(@slug.gsub(/\s/, '-'))
      end

      def character_params
        params.require(:character).permit(:name, :power, :strenght, :attack, :charisma, :spirit, :special_skill, :token, :image, :race_id, :kind_id, :slug, :history)
      end
    end
  end
end