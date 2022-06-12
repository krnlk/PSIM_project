class AddIndexToUserDataLogin < ActiveRecord::Migration[7.0]
  def change
    add_index :user_data, :login, unique: true
  end
end
