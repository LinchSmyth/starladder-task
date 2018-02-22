class UsersController < ApplicationController
  skip_before_action :render_layout, only: :login

  def login
    @user = current_user
    render 'users/login'
  end

  def update
    if current_user.update(user_params)
      head :ok
    else
      render json: current_user.errors.full_messages
    end
  end


  private


  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
