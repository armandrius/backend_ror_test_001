require 'rails_helper'
RSpec.describe PurchasesController, type: :controller do
  render_views
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @user = User.last
    @purchase_option = PurchaseOption.first
  end
  it "lets users purchase contents that have never been purchased through a purchase option" do
    post :create, params: {
      user_id: @user.id,
      purchase_option_id: @purchase_option.id
    }
    expect(response.status).to be 200
    purchase = json
    expect(purchase["user_id"]).to eq @user.id
    expect(purchase["purchase_option_id"]).to eq @purchase_option.id
    expect(purchase["content"]["id"]).to eq @purchase_option.content.id
    expect(purchase["content"]["type"]).to eq @purchase_option.content.class.name.downcase
  end

  it "doesn't let users purchase duplicate contents that haven't expired yet" do
    post :create, params: {
      user_id: @user.id,
      purchase_option_id: @purchase_option.id
    }
    expect(response.status).to be 200

    post :create, params: {
      user_id: @user.id,
      purchase_option_id: @purchase_option.id
    }
    expect(response.status).not_to be 200
    expect(json).to have_key "errors"
  end

  it "lets users purchase duplicate contents if they have expired" do
    post :create, params: {
      user_id: @user.id,
      purchase_option_id: @purchase_option.id
    }
    expect(response.status).to be 200

    @user.purchases.find_by_purchase_option_id(@purchase_option.id).update_columns(expires_at: 1.hour.ago)

    post :create, params: {
      user_id: @user.id,
      purchase_option_id: @purchase_option.id
    }
    expect(response.status).to be 200

    expect(@user.purchases.where(purchase_option_id: @purchase_option.id).count).to eq 2
  end
end
