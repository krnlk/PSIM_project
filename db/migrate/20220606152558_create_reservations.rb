class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      #t.integer :reservation_id
      #instead of the above, there's a built-in default t_integer: id
      t.date :date
      t.time :time_from
      t.time :time_to
      t.integer :price_list_id
      t.integer :track_id
      t.integer :shoe_id
      t.integer :client_id
      #t.references :price_list, null: false, foreign_key: true
      #t.references :track, null: false, foreign_key: true
      #t.references :shoe, foreign_key: true #there doesn't need to be a shoe together with the reservation
      #t.references :client, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
