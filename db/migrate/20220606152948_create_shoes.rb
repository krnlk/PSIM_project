class CreateShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoes do |t|
      #t.integer :shoe_id
      #instead of the above, there's a built-in default t_integer: id
      t.integer :size

      t.timestamps
    end
  end
end
