class RemoveProposedTimeFromTimeslots < ActiveRecord::Migration
  def up
    remove_column :timeslots, :proposed_time
  end

  def down
    add_column :timeslots, :proposed_time, :datetime
  end
end
