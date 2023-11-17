class BookmarksController < ApplicationController
  before_action :grab_list, only: %i[new create destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @movie = Movie.find(params['bookmark'][:movie_id])
    @bookmark = Bookmark.new(review_bookmark)
    @bookmark.movie = @movie
    @bookmark.list = @list # Importanteeeee para linkearlo
    if @bookmark.save
      redirect_to list_path(grab_list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
  private

  def grab_list
    @list = List.find(params[:list_id])

  end

  def review_bookmark
    params.require(:bookmark).permit(:comment, :movie)

  end
end
