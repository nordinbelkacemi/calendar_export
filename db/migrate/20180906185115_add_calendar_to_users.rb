class AddCalendarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :calendar, :string
  end
end
