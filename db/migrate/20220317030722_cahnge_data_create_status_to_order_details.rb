class CahngeDataCreateStatusToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :order_details, :create_status, :integer
  end
end
