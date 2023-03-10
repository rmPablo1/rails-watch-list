class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @reviews = Review.where(list_id: params[:id]).order(created_at: :desc).first(3)
    @review = Review.new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(list_id: params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:list).permit(:name, :background_image)
  end
end
