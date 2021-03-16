class CreateCashEntrances < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_entrances do |t|
      t.string :description
      t.string :type
      t.integer :value
      t.date :date_entrance
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
