require 'rails_helper'
RSpec.describe ContentsController, type: :controller do
  describe "index" do
    render_views
    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end
    it "renders the list of contents, ordered by time of creation" do
      get :index
      expect(response.status).to be 200
      expect(json).to have_key "contents"

      contents = json["contents"]
      expect(contents).not_to be_empty
      expect(contents.first).to have_key "type"
      expect(contents.first).to have_key "title"
      expect(contents.first).to have_key "plot"
      expect(contents.first).to have_key "created_at"
      expect(contents).to eq contents.sort_by { |content| content["created_at"] }
      expect(contents.length).to eq Season.count + Movie.count
    end
  end
end
