class RemoveCardTypeFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :card_type
  end
end
