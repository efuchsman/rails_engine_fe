class Item
  attr_reader :id,
              :type,
              :name,
              :description,
              :unit_price,
              :merchant_id

  def initialize(data)
    @id = data[:id].to_i
    @type = data[:type]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @unit_price = data[:attributes][:unit_price]
    @merchant_id = data[:attributes][:unit_price]
  end
end
