class ChangeDataStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :status, :integer
  end
end
