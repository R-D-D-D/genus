class AddPublishedToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :published, :boolean, default:  false
    add_column :events, :published_at, :datetime
  end
end
