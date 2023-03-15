class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @list = List.find(params[:list_id])
    authorize @review
  end

  def create
    @review = Review.new(set_params)
    @list = List.find(params[:list_id])
    authorize @review
    @review.user = current_user
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def set_params
    params.require(:review).permit(:comment, :rating)
  end
end
