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
      ["Amount",          "$#{amount}"],
      ["Signature",       sig_image]
    ]
    items << ["Additional Information", user.additional_information] if user.additional_information?
    items
  end

  def sig_image
    ActionController::Base.helpers.image_tag(signature)
  end
end
