require 'rails_helper'
RSpec.describe LibraryController, type: :controller do
  render_views
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  it "renders the library of a user sorted by the remaining time to watch the content" do
    @user = User.first
    get :index, params: {
      user_id: @user.id
    }
    expect(response.status).to be 200
    expect(json).to have_key "contents"
    contents = json["contents"]
    expect(contents).not_to be_empty
    expect(contents.first).to have_key "remaining_time"
    expect(contents).to eq contents.sort_by { |content| content["remaining_time"] }
  end

  it "renders only contents that haven't expired" do
    @user = User.last
    purchase1 = @user.purchases.create! purchase_option: Movie.first.purchase_options.first
    purchase1.update_columns created_at: 3.days.ago, expires_at: 1.day.ago # mock expired purchase

    purchase2 = @user.purchases.create! purchase_option: Season.last.purchase_options.first

    get :index, params: {
      user_id: @user.id
    }
    contents = json['contents']
    expect(contents.none? { |content| content["id"] == purchase1.content.id && content["type"] == 'movie' }).to be true
    expect(contents.find { |content| content["id"] == purchase2.content.id && content['type'] == 'season'}).to be_present
  end
end
