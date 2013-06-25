class AddRequesterIdToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :requester_id, :integer
  end
end
