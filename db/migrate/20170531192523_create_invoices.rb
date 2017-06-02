class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :product
      t.binary :signature
      t.float :amount, null: false
      t.string :card_type
      t.string :card_number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
