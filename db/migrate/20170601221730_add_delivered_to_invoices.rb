class AddDeliveredToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :delivered, :boolean
  end
end
