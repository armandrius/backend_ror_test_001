class MoviesController < ContentsController
  def index
    @movies = Movie.all_cached
  end
end
