class Shoe < ApplicationRecord
    #setting up associations
    has_many :reservations

    #which attributes need to filled out during creation, which ones need to be unique
    validates :id, uniqueness: true
    validates :size, presence:true
end
