class RenameAddressToAdressInAdresses < ActiveRecord::Migration[6.1]
  def up
    rename_column :adresses, :address, :adress
  end
end
