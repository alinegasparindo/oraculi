class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @mentor = User.find(params[:user_id])
  end

   def create
    @review = Review.new(review_params)
    @mentor = User.find(params[:user_id])
    @review.mentor = @mentor
    @review.mentee = current_user
    if @review.save
      redirect_to user_path(@mentor)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate, :mentee, :mentor)
  end

end
