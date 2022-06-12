class Reservation < ApplicationRecord
    #def change
        belongs_to :shoe
        belongs_to :track
        belongs_to :price_list
        belongs_to :client

        validates :date, presence:true
        validates :time_from, presence:true
        validates :time_to, presence:true
    #end
end
