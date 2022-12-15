require 'rails_helper'

RSpec.describe MerchantService do
  it 'exists', :vcr do
    merchant = MerchantService.new

    expect(merchant).to be_an_instance_of(MerchantService)
  end

  describe "Class Methods" do
    describe "#merchants" do
      it "returns all merchants", :vcr do
        merchants = MerchantService.merchants

        expect(merchants).to be_a Array
        expect(merchants.first).to be_a Merchant
        expect(merchants.first.id).to be_a Integer
        expect(merchants.first.type).to be_a String
        expect(merchants.first.name).to be_a String
      end
    end

    describe "#merchant_by_id" do
      it "returns a merchant based off a given id", :vcr do
        merchant_id = 4
        merchant = MerchantService.merchant_by_id(merchant_id)

        expect(merchant).to be_a Merchant
        expect(merchant.id).to be_a Integer
        expect(merchant.type).to be_a String
        expect(merchant.name).to be_a String
      end
    end

    describe "#merchant_items" do
      it "returns all items for a given merchant", :vcr do
        merchant_id = 4
        merchant_items = MerchantService.merchant_items(merchant_id)

        expect(merchant_items).to be_a Array
        expect(merchant_items.count).to eq(12)
      end
    end
  end
end
