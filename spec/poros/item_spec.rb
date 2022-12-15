require 'rails_helper'
require './app/poros/item.rb'

RSpec.describe Item do
  it 'exists' do
    attrs =
    {
      "id": "80",
      "type": "item",
      "attributes": {
      "name": "Item In Sed",
      "description": "Voluptas aliquid dolores deserunt dolor ipsa. Illum eum aspernatur et. Sit repellendus neque dolor. Qui natus omnis dicta occaecati placeat. Odio ipsam nisi cupiditate nihil exercitationem qui labore.",
      "unit_price": 548.08,
      "merchant_id": 4
      }
      }

    item = Item.new(attrs)

    expect(item).to be_an_instance_of(Item)
  end
end
