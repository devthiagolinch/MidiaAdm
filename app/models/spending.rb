class Spending < ApplicationRecord

    # Soma totos os valores dos gastos independente do mes
    def self.total
        self.group_by_month(:created_at).sum(:value)
    end
end
