require 'rails_helper'
require './app/poros/merchant.rb'

RSpec.describe Merchant do
  it 'exists' do
    attrs = {
      id: "1",
      type: "merchant",
      attributes: {
      name: "Schroeder-Jerde"
      }
    }

    merchant = Merchant.new(attrs)

    expect(merchant).to be_an_instance_of(Merchant)
    expect(merchant.name).to eq("Schroeder-Jerde")
  end
end
