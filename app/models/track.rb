class Track < ApplicationRecord
    #setting up associations
    has_many :malfunctions
    has_many :reservations

    #which attributes should be unique
    validates :id, uniqueness: true
end
