class AddCustomerIdToOders < ActiveRecord::Migration[6.1]
  def change
    add_column :oders, :customer_id, :integer
  end
end
