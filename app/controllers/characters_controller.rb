class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def edit
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:success] = 'Creado existosamente'
      redirect_to character_path(@character)
    else
      flash[:danger] = 'Ups hubo un problema creando este personaje'
      puts @character.errors.full_messages
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :power, :strenght, :attack, :charisma, :spirit, :special_skill, :token)
  end
end
