class OrderAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address_number, :build, :telephone_number, :order_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}$|/, message: "is invalid. Input full-width characters." }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters." }
    validates :area_id, :city, :address_number
  end
  validates :user_id, :item_id, presence: true

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(post_code: post_code, area_id:area_id, city:city, address_number:address_number, build:build, telephone_number:telephone_number, order_id:order.id)
  end
end