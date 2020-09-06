class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false #郵便番号
      t.string :prefecture_id, null: false #都道府県
      t.string :city, null: false #市区町村
      t.string :house_number, null: false #番地
      t.string :apartment #建物名
      t.text :phone_number # 電話番号
      t.integer :user_id
      t.text :contact #その他

      t.timestamps
    end
  end
end
