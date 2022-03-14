class ChangeColumnDefaultOnOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :payment_method, from: nil, to: "0"
    
  end
end
  