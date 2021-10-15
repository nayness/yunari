class RacesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_race, only: [:show, :edit, :update, :destroy]

  def index
    @races = Race.all
  end

  def show
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      flash[:success] = "Creado exitosamente"
      redirect_to races_path
    else
      flash[:danger] = "Ocurrió un error creando la raza"
      render :new
    end
  end

  def edit
  end

  def update
    if @race.update(race_params)
      flash[:success] = "Actualizado exitosamente"
      redirect_to races_path
    else
      flash[:danger] = "Ocurrió un error actualizando"
      render :edit
    end
  end

  def destroy
    if @race.destroy
      flash[:success] = "Eliminado exitosamente"
    else
      flash[:danger] = "Ocurrió un error al eliminar este recurso"
      redirect_to race_path(@race)
    end
  end

  private

  def set_race
    @race = Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:name)
  end
end
