class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :day
      t.string :morning_tranmission
      t.string :morning_files
      t.string :night_transmission
      t.string :night_files
      t.string :night_sound

      t.timestamps
    end
  end
end
