json.extract! invoice, :id, :product, :amount, :card_type, :card_last4, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
