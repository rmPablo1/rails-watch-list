class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new(set_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    authorize @bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_params
    params.require(:bookmark).permit(:title, :rating, :comment, :photo)
  end
end
