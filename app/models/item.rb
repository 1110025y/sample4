class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :user, optional: true #外部キーのnilを許可する
  has_many :comments
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status
end
