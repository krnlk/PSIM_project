class CreatePriceLists < ActiveRecord::Migration[7.0]
  def change
    create_table :price_lists do |t|
      t.integer :price_list_id
      t.integer :price
      t.string :item_type
      t.string :weekday
      t.time :time_from
      t.time :time_to
      t.boolean :current

      t.timestamps
    end
  end
end
