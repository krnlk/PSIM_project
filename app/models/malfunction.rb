class Malfunction < ApplicationRecord
    #def change
        belongs_to :track

        validates :date, presence:true
        validates :time_from, presence:true
        validates :time_to, presence:true
    #end
end
