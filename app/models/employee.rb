class Employee < ApplicationRecord
    #def change
        #has_one :user_datum
        belongs_to :user_datum
        
    #end
end
