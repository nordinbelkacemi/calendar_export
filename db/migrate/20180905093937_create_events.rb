class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :place

      t.timestamps
    end
  end
end
