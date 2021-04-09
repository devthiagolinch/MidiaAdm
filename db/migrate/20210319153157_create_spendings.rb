class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|
      t.string :description
      t.float :value
      t.date :date

      t.timestamps
    end
  end
end
