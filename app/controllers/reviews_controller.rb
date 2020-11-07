class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @babysitter = Babysitter.find(params[:babysitter_id])
    @review.babysitter = @babysitter
    if @review.save
      redirect_to babysitter_path(@babysitter)
    else
      @review = Review.new
      render "babysitters/show"
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
