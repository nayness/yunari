class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_slug, only: [:public_info, :search_slug]

  def index
    if user_signed_in?
      @characters = current_user.characters
    else
      @characters = Character.all
    end
  end

  def show
  end

  def public_info
    @character = Character.find_by(slug: @slug)
    if @character.nil? || @character&.privacy?
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def search_slug
    render json: { total: Character.where(slug: @slug).count }
  end

  def new
    @character = Character.new
    @remaining_points = 2000
  end

  def edit
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user if current_user.present?
    if @character.save
      flash[:success] = 'Creado existosamente'
      redirect_to character_path(@character)
    else
      @remaining_points = @character.remaining_points
      flash[:danger] = 'Ups hubo un problema creando este personaje'
      puts @character.errors.full_messages
      render :new
    end
  end

  def update
    @updated = @character.update(character_params.except(:name))
    if @updated
      flash[:success] = 'Se ha actualizado exitosamente'
      redirect_to character_path(@character)
    else
      @remaining_points = @character.remaining_points
      flash[:danger] = 'Ups hubo un problema editando este personaje'
      puts @character.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @character.destroy
      flash[:success] = 'Se ha eliminado exitosamente'
      redirect_to characters_path
    else
      flash[:danger] = 'Ocurrió un problema eliminando este personaje'
      redirect_to edit_character(@character)
    end
  end

  private

  def set_slug
    @slug = params[:slug] || character_params[:slug]
    @slug = @slug.downcase.strip.gsub(/[^0-9A-Za-z-]/, '')
    @slug = I18n.transliterate(@slug.gsub(/\s/, '-'))
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :power, :strenght, :attack, :charisma, :spirit, :special_skill, :token, :image, :race_id, :kind_id, :slug, :history)
  end
end
