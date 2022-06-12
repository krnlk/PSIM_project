class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    #create_table :employees do |t|

    create_table :user_data do |t|
      t.integer :user_datum_id
      t.string :first_name
      t.string :last_name
      t.string :login
      t.string :email
      #t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
