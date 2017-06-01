class RemoveCardNumberFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :card_number
  end
end
