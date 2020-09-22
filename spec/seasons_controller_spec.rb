require 'rails_helper'
RSpec.describe SeasonsController, type: :controller do
  describe "index" do
    render_views
    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it "renders the list of seasons, ordered by time of creation" do
      get :index

      expect(response.status).to be 200
      expect(json).to have_key "seasons"

      seasons = json["seasons"]
      expect(seasons).not_to be_empty
      expect(seasons.first).to have_key "created_at"
      expect(seasons).to eq seasons.sort_by { |season| season["created_at"] }
    end

    it "includes the list of episodes ordered by its number" do
      get :index
      expect(response.status).to be 200
      seasons = json["seasons"]
      expect(seasons).not_to be_empty
      seasons.each do |season|
        episodes = season["episodes"]
        expect(episodes).not_to be_empty
        expect(episodes.first).to have_key "created_at"
        expect(episodes).to eq episodes.sort_by { |episode| episode["created_at"] }
      end
    end
  end
end
