class CreateShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoes do |t|
      t.integer :shoe_id
      t.integer :size

      t.timestamps
    end
  end
end
