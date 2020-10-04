class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :user_id # バリデーション（ユーザーと記事の組み合わせは一意）
end
