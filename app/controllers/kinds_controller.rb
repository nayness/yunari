class KindsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_kind, only: [:show, :edit, :update, :destroy]

  def index
    @kinds = Kind.all
  end

  def show
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new(kind_params)
    if @kind.save
      flash[:success] = "Creado exitosamente"
      redirect_to kinds_path
    else
      flash[:danger] = "Ocurrió un error creando la raza"
      render :new
    end
  end

  def edit
  end

  def update
    if @kind.update(kind_params)
      flash[:success] = "Actualizado exitosamente"
      redirect_to kinds_path
    else
      flash[:danger] = "Ocurrió un error actualizando"
      render :edit
    end
  end

  def destroy
    if @kind.destroy
      flash[:success] = 'Eliminado exitosamente'
      redirect_to kinds_path
    else
      flash[:danger] = 'Ocurrió un error al eliminar este recurso'
      redirect_to kind_path(@kind)
    end
  end

  private

  def set_kind
    @kind = Kind.find(params[:id])
  end

  def kind_params
    params.require(:kind).permit(:name)
  end
end
