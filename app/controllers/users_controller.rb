class UsersController < ApplicationController
  def index
    @users = User.all
    @reviews = Review.all
  end

  def show
    @user = User.find(params[:id])
  end
end
