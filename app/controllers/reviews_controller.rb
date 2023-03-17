class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(@user), notice: t("thankyoureview")
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating_star, :description)
  end
end
