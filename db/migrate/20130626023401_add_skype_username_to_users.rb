class AddSkypeUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skype, :string
  end
end
