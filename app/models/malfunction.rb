class Malfunction < ApplicationRecord
    #setting up associations
    belongs_to :track

    #which attributes need to be unique
    validates :id, uniqueness: true
    validates :date, presence:true
    validates :time_from, presence:true
    #time_from should be an earlier date in the day than time_to
    validates :time_to, presence:true, comparison: { greater_than: :time_from }
end
