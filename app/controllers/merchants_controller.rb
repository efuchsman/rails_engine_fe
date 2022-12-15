class MerchantsController < ApplicationController
  def index
    @merchants = MerchantService.merchants
  end

  def show
    @merchant = MerchantService.merchant_by_id(params[:id])
    @items = MerchantService.merchant_items(@merchant.id)
  end
end
