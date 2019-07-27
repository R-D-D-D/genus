class CreateUpcomingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :upcoming_events do |t|
      t.string :title
      t.string :content
      t.string :date

      t.timestamps
    end
  end
end
