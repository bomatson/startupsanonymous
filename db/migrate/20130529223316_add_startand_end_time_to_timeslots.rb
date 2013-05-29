class AddStartandEndTimeToTimeslots < ActiveRecord::Migration
  def up
    add_column :timeslots, :start_time, :datetime
    add_column :timeslots, :end_time, :datetime
  end

  def down
    remove_column :timeslots, :start_time
    remove_column :timeslots, :end_time
  end
end
