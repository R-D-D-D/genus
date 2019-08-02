class AddThumbnailTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :thumbnail_type, :string
  end
end
