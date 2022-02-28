class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      
      t.string :delivery_postal
      t.string :delivery_address
      t.string :delivery_name
      t.integer :total_cost
      t.integer :postage
      t.integer :payment_method
      t.boolean :status

      t.timestamps
    end
  end
end
