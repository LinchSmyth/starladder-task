class UsersController < ApplicationController
  skip_before_action :render_layout, only: :login

  def login
    @user = current_user
    render @user
  end
end
