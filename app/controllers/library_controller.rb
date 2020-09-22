class LibraryController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @purchases = @user.purchases.where('expires_at > created_at').sort_by &:remaining_time_seconds
  end
end
