class AddDeliveredToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :delivered, :boolean, default: false
  end
end
