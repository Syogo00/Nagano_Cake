class AddColumnItems < ActiveRecord::Migration[6.1]
  def up
    add_column :items, :genre_id, :integer
  end
end
