require 'rails_helper'
RSpec.describe LibraryController, type: :controller do
  before :each do
    @user = User.first
  end

  it "renders the library of a user sorted by the remaining time to watch the content" do
    get :index, params: {
      user_id: @user.id
    }
    expect(response.status).to be 200
    expect(json).to have_key "contents"
    contents = json["contents"]
    expect(contents).not_to be_empty
    expect(contents.first).to have_key "remaning_time"
    expect(contents).to eq contents.sort_by { |content| content["remaining_time"] }
  end

  it "renders only contents that haven't expired" do
    movie1 = Movie.create! title: '300: Rise of an Empire', plot: 'Spartans looking forward to dying beautifully'
    movie2 = Movie.create! title: 'The Godfather', plot: 'Italian gangsters'

    purchase1 = @user.purcaches.create! purchase_option: movie1.purchase_options.first
    purchase1.update_columns expires_at: 1.day.ago # mock expired purchase

    purchase2 = @user.purcaches.create! purchase_option: movie2.purchase_options.first

    get :index, params: {
      user_id: @user.id
    }
    contents = json['contents']
    expect(contents.none? { |content| content["id"] == purchase1.id }).to be true
    expect(contents.any? { |content| content["id"] == purchase2.id }).to be true
  end
end
