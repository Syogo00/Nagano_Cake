class AddcustomerIdToAdresses < ActiveRecord::Migration[6.1]
  def change
    add_column :adresses, :customer_id, :integer
  end
end
