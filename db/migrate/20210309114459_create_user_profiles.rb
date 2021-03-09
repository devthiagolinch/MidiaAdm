class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :address
      t.date :birthdate
      t.integer :cellphone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
