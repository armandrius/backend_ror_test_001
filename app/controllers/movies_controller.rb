class MoviesController < ContentsController
  def index
    @movies = Movie.order(:created_at)
  end
end
