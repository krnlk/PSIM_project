class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      #t.integer :track_id
      #instead of the above, there's a built-in default t_integer: id
      t.boolean :error

      t.timestamps
    end
  end
end
