class AddCustomerToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :customer, :string
  end
end
