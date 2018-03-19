class UsersController < ApplicationController

  def show
    @user = current_user
    @user_images = current_user.images
  end
end
