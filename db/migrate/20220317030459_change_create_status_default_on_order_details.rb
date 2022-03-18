class ChangeCreateStatusDefaultOnOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_default :order_details , :create_status, from: nil, to: "0"
  end
end
