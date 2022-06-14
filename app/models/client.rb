class Client < ApplicationRecord
    #setting up associations
    belongs_to :user_datum
    has_many :reservations
    
    #which attributes need to be unique
    validates :id, uniqueness: true
end
