class RenameAdressToAddressInAddresses < ActiveRecord::Migration[6.1]
  def up
    rename_column :addresses, :adress, :address
  end
end
