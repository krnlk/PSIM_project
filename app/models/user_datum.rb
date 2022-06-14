class UserDatum < ApplicationRecord
  #setting up associations
  has_one :client
  has_one :employee

  #for login
  has_secure_password
  has_secure_password

  #which attributes should be filled out, which ones should be unique
  validates :id, uniqueness: true
  #make sure an actual email is passed and not just some random junk
  validates :email, presence:true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence:true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence:true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :login, presence:true, uniqueness: true
  #password needs to be at least 6 characters long
  validates :password, presence:true, length: {minimum: 6}

  #for authorization
  def invalidate_token
    self.update_columns(token: nil)
  end
end
