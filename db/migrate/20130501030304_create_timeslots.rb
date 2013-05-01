class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :schedule_id
      t.boolean :confirmed, default: false
      t.datetime :proposed_time

      t.timestamps
    end
  end
end
