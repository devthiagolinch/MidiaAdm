class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|
      t.string :description
      t.integer :value
      t.date :date

      t.timestamps
    end
  end
end
