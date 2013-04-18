class AddAnonymousToUsers < ActiveRecord::Migration
  def up
    add_column :users, :anonymous, :boolean, default: true, null: false
  end

  def down
    remove_column :users, :anonymous, :boolean, default: nil
  end
end
