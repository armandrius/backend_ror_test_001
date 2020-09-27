class LibraryController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @purchases = Rails.cache.fetch "users/#{params[:user_id]}/library", expires_in: 5.minutes do
      @user.purchases.where("CAST(strftime('%s', expires_at) AS INT) > CAST(strftime('%s', 'now') AS INT)").order(Arel.sql "CAST(strftime('%s', expires_at) AS INT) - CAST(strftime('%s', 'now') AS INT)")
    end
  end
end
