class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @lists = policy_scope(List)
    @list = List.new
  end
  def show
    @reviews = Review.where(list_id: params[:id]).order(created_at: :desc).first(3)
    @review = Review.new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(list_id: params[:id])
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(set_params)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to list_path(@list)
    else
      render "index", status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update(set_params)
      redirect_to list_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:list).permit(:name, :background_image)
  end
end
