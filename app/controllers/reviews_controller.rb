class ReviewsController < ApplicationController
  before_action :set_console, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.console = @console
    if @review.save
      redirect_to console_path(@console)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to console_path(@review.console), status: :see_other
  end

  private

  def set_console
    @console = Console.find(params[:console_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
