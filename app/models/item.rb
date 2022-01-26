class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :charge
  belongs_to :status
  belongs_to :term
  belongs_to :user
  has_one_attached :image

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :title, :content, :category_id, :status_id, :charge_id, :area_id, :term_id, :price, :user, :image, presence: true
  validates :area_id, :term_id, :category_id, :status_id, :charge_id, numericality: { other_than: 1, message: "can't be blank" }
end
