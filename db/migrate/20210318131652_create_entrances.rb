class CreateEntrances < ActiveRecord::Migration[5.2]
  def change
    create_table :entrances do |t|
      t.string :description
      t.string :type_of_entrance
      t.integer :value
      t.date :date_of_entrance

      t.timestamps
    end
  end
end
