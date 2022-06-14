class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      #t.integer :employee_id
      #instead of the above, there's a built-in default t_integer: id
      t.integer :user_datum_id
      #t.references :user_datum, null: false, foreign_key: true
      #t.references :user_datum, null: false, foreign_key: true
      #t.belongs_to :user_datum, foreign_key: true

      t.timestamps
    end
  end
end
