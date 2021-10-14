class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def edit_account
    @user = current_user
  end

  def update_account
    if current_user.update(user_params.except(:password))
      flash[:success] = 'Los datos han sido actualizados exitosamente'
      redirect_to profile_user_path(current_user)
    else
      flash[:danger] = 'Ocurrió un problema actualizando tus datos'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :alias)
  end
end
