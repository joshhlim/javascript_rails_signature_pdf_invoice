class AddAddressToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :address, :string, null: false
  end
end
