class RemoveProductFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :product
  end
end
