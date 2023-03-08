class ReviewsController < ApplicationController

  def create
    @review = Review.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to users_path(@user)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating_star, :description)
  end
end
