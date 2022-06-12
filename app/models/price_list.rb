class PriceList < ApplicationRecord
    #def change
        has_many :reservations

        validates :current, presence:true
        validates :item_type, presence:true
        validates :price, presence:true
        validates :time_from, presence:true
        validates :time_to, presence:true
        validates :weekday, presence:true
    #end
end
