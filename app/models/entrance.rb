class Entrance < ApplicationRecord

    #Scopes
    scope :last_entrance, -> { 
        order('created_at desc')
    }

    # Soma totos os valores dos gastos independente do mes
    def self.total
        self.sum(:value)
    end

end
