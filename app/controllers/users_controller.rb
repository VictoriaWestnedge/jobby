class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_reviews = @user.reviews.order(created_at: :desc)
    @review = Review.new
    rating = 0
    @user_reviews.each {|user| rating += user.rating_star}
    @comon = rating/@user_reviews.size
    @user.rating = @comon
    @user.save
    # @date = Date.today.strftime('%d/%m/%Y')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

  end



  private
  def user_params
    params.require(:user).permit(:nickname)
  end
end
