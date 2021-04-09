class Entrance < ApplicationRecord

    #Scopes
    scope :last_entrance, -> { 
        order('created_at desc')
    }

end
