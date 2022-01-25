class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :charge
  belongs_to :status
  belongs_to :term
  belongs_to :user

  validates :title, :content, :category_id, :status_id, :charge_id, :area_id, :term_id, :price, :user, presence: true
  validates :genre_id, :area_id, :term_id, :category_id, :status_id, :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
end
