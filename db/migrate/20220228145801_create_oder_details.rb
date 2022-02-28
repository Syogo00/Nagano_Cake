class CreateOderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_details do |t|
      
      t.integer :count
      t.integer :cost
      t.boolean :create_status

      t.timestamps
    end
  end
end
