class Order_address
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address_number, :build, :telephone_number, :order

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}$|/, message: "is invalid. Input full-width characters." }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters." }
    validates :area_id, :city, :address_number, :order_id
  end
  validates :user_id, :item_id, presence: true

  def save
    Address.save(post_code: post_code, area_id:area_id, city:city, address_number:address_number, build:build, elephone_number:elephone_number)
    Order.save(user_id:user.id, item_id:item.id)
  end
end