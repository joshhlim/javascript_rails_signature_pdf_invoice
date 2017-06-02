class AddCustomerToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :customer, :string, null: false
  end
end
