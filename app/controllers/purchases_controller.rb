class PurchasesController < ApplicationController
  def create
    @user = User.find params[:user_id]
    @purchase_option = PurchaseOption.find params[:purchase_option_id]
    @purchase = @user.purchases.new(purchase_option: @purchase_option)
    if @purchase.save
      render :show
    else
      render json: { errors: @purchase.errors.messages }, status: :bad_request
    end
  end
end
