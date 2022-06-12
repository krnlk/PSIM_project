class AddPaswordDigestToUserData < ActiveRecord::Migration[7.0]
  def change
    add_column :user_data, :password_digest, :string
  end
end
