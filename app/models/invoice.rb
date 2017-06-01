class Invoice < ActiveRecord::Base
  belongs_to :user

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: product,
      company: {
        name: "Steve's Coffee",
        address: "123 Four Street\nSan Diego, CA 92120",
        email: "service@stevescoffee.com",
        logo: Rails.root.join("app/assets/images/stevescoffee.png")
      },
      line_items: line_items
    )
  end

  def line_items
    items = [
      ["Date",            created_at.strftime("%B %d, %Y")],
      ["Account Billed",  "#{user.name} (#{user.email})"],
      ["Product",         "#{product}"],
      ["Amount",          "$#{amount}"],
      ["Charged to",      "#{card_type} (**** **** **** #{card_last4})"],
      ["Signature",       sig_image]
    ]
    items << ["Additional Information", user.additional_information] if user.additional_information?
    items
  end

  def sig_image
    ActionController::Base.helpers.image_tag(signature)
  end

  def card_last4
    self.card_number[self.card_number.length - 4,4]
  end

  # def prawn_receipt
  #   id = self.id
  #   created_at = self.created_at
  #   client_name = self.user.name
  #   product = self.product
  #   amount = self.amount
  #   type = self.card_type
  #   last_4 = self.card_last4
  #   sig = self.signature
  #   puts "sig is #{sig}, class is #{sig.class}"
  #   Prawn::Document.generate("invoice#{self.id}.pdf") do 
  #     text "INVOICE FOR CHARGE \##{id}"
  #     move_down 50
  #     text "Date                    #{id}"
  #     stroke_horizontal_rule
  #     move_down 10
  #     text "Account Billed           #{created_at}"
  #     stroke_horizontal_rule
  #     move_down 10
  #     text "Product                  #{client_name}"
  #     stroke_horizontal_rule
  #     move_down 10
  #     text "Amount                   #{amount}"
  #     stroke_horizontal_rule
  #     move_down 10
  #     text "Charged to              #{type}(**** **** **** #{last_4})"
  #     stroke_horizontal_rule
  #     move_down 20
  #     # temp = Tempfile.new('sigimg')
  #     # temp.write Base64.decode64(sig)
  #     # temp.close
  #     # # image_data = StringIO.new(Base64.decode64(self.signature))
  #     # image temp.path
  #   end
  # end
end
