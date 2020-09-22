require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
  render_views
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end
  it "renders the list of movies, ordered by time of creation" do
    get :index
    expect(response.status).to eq 200
    expect(json).to have_key "movies"

    movies = json["movies"]
    expect(movies).not_to be_empty
    expect(movies).to eq movies.sort_by { |movie| movie["created_at"] }
  end
end
