class LibraryController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @purchases = Rails.cache.fetch "users/#{params[:user_id]}/library", expires_in: 5.minutes do
      @user.purchases.where('expires_at > created_at').sort_by &:remaining_time_seconds
    end
  end
end
