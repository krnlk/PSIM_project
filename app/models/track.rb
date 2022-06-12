class Track < ApplicationRecord
    #def change
        has_many :malfunctions
        has_many :reservations
    #end
end
