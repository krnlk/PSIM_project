class Reservation < ApplicationRecord
    #setting up associations
    belongs_to :shoe
    belongs_to :track
    belongs_to :price_list
    belongs_to :client

    #which attributes need to be filled out during creation, which ones need to be unique
    validates :id, uniqueness: true
    validates :date, presence:true
    validates :time_from, presence:true
    #time_from should be an earlier date in the day than time_to
    validates :time_to, presence:true, comparison: { greater_than: :time_from }
end
