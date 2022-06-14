class Employee < ApplicationRecord
    #setting up associations
    belongs_to :user_datum
    
    #which attributes need to be unique
    validates :id, uniqueness: true
end
