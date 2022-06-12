class AddTokenToUserData < ActiveRecord::Migration[7.0]
  def change
    add_column :user_data, :token, :string
    add_index :user_data, :token
  end
end
