class UserDatum < ApplicationRecord
    #def change
      #belongs_to :client
      #belongs_to :employee
      has_one :client
      has_one :employee

      has_secure_password
      has_secure_password

      validates :email, presence:true, uniqueness: true
      validates :first_name, presence:true
      validates :last_name, presence:true
      validates :login, presence:true, uniqueness: true
      validates :password, presence:true, length: {minimum: 6}
    #end
    def invalidate_token
      self.update_columns(token: nil)
    end
end
