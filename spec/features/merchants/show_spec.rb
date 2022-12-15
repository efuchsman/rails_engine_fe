# and when I click the merchant's name
# I should be on page '/merchants/:id'
# And I should see a list of items that merchant sells.
require "rails_helper"

describe "Merchant Show Page" do
  before :each do
    @merchant_id = 4
    @merchant = MerchantService.merchant_by_id(@merchant_id)
    @items = MerchantService.merchant_items(@merchant_id)
  end

  describe "As a visitor," do
    describe "When I visit /merchants/:id" do
      it "And I should see a list of items that merchant sells.", :vcr do
        visit "/merchants/#{@merchant_id}"

        expect(page).to have_content(@merchant.name)

        within("#item-#{@items.first.id}") do
          expect(page).to have_link("#{@items.first.name}")
        end

      end
    end
  end
end
