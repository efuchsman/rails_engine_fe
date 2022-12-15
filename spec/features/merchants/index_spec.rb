require 'rails_helper'

describe "Merchants Index Page" do
  before :each do
    @merchants = MerchantService.merchants
    @merchant1 = @merchants.first
  end

  describe "As a visitor," do
    describe "When I visit '/merchants'" do
      it "I should see a link list of merchants by name", :vcr do
        visit "/merchants"

        within("#merchant-#{@merchant1.id}") do
          expect(page).to have_link("#{@merchant1.name}")
        end

      end

      describe "When click on a merchant's name" do
        it "I am redirected to that merchant's show page", :vcr do
          visit "/merchants"

          within("#merchant-#{@merchant1.id}") do
            click_link("#{@merchant1.name}")
          end

          expect(current_path).to eq("/merchants/#{@merchant1.id}")
        end
      end
    end
  end
end
