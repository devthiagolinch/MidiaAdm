class Spending < ApplicationRecord

    # Soma totos os valores dos gastos independente do mes
    def self.total
        self.sum(:value)
    end
end
