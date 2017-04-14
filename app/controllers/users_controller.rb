class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end
