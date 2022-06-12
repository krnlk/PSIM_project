class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.integer :user_datum_id
      #t.belongs_to :user_datum, foreign_key: true
      #t.references :user_datum, foreign_key: true
      #t.references :personals_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
