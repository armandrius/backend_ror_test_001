require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
  describe "index" do
    it "renders the list of movies, ordered by time of creation" do
      get :index
      expect(response.status).to eq 200
      expect(json).to have_key "movies"

      movies = json["movies"]
      expect(movies).not_to be_empty
      expect(movies).to be_sorted by: :created_at, vers: :asc
    end
  end
end
