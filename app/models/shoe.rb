class Shoe < ApplicationRecord
    #def change
    #potentially incorrect relation type
        has_many :reservations

        validates :size, presence:true
    #end
end
