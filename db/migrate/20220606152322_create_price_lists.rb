class CreatePriceLists < ActiveRecord::Migration[7.0]
  def change
    create_table :price_lists do |t|
      #t.integer :price_list_id
      #instead of the above, there's a built-in default t_integer: id
      t.integer :price
      t.integer :item_type
      t.integer :weekday
      t.time :time_from
      t.time :time_to
      t.boolean :current

      t.timestamps
    end
  end
end
