require './app/poros/merchant.rb'

class MerchantService

  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end

  def self.merchants
    json = self.to_json(self.response("/api/v1/merchants"))
    @merchants = json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.merchant_by_id(id)
    json = self.to_json(self.response("/api/v1/merchants/#{id}"))
    @merchant = json[:data]
      Merchant.new(@merchant)
  end

  def self.to_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.merchant_items(id)
    json = self.to_json(self.response("/api/v1/merchants/#{id}/items"))
    @merchant_items = json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def self.response(url)
    conn.get(url)
  end
end
