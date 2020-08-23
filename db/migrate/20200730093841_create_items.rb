class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :status_id, null: false #商品の状態
      t.string :prefecture_id, null: false #発送元の地域
      t.string :shipping_date_id, null: false #発送までの日数
      t.string :delivery_fee_id, null: false #配送料の負担
      t.integer :price, null: false

      t.timestamps
    end
  end
end
