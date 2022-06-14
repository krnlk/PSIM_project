class PriceList < ApplicationRecord
    #defining an enum
    enum item_type: {
        track: 1,
        shoe: 2
    }

    #defining an enum
    enum weekday: {
        monday: 1,
        tuesday: 2,
        wednesday: 3,
        thursday: 4,
        friday: 5,
        saturday: 6,
        sunday: 7
    }

    #setting up associations
    has_many :reservations

    #which attributes need to be filled out during creation, which ones need to be unique
    validates :id, uniqueness: true
    validates :item_type, presence:true
    validates :price, presence:true
    validates :time_from, presence:true
    #time_from should be an earlier date in the day than time_to
    validates :time_to, presence:true, comparison: { greater_than: :time_from }
    validates :weekday, presence:true
end
