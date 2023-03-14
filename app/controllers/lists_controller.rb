class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @lists = List.all.where(user: current_user)
    else
      @lists = List.all
    end
    @list = List.new
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
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    else
      render "index", status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:list).permit(:name, :background_image)
  end
end
