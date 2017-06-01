class Invoice < ActiveRecord::Base
  belongs_to :user
  scope :not_delivered, -> { where(delivered: false) }
  scope :delivered, -> { where(delivered: true) }
  scope :this_week, -> { where(delivery_date: Time.now.beginning_of_week..Time.now.end_of_week) }
  scope :this_monday, -> { where(delivery_date: Time.now.beginning_of_week..Time.now.beginning_of_week + 1.day) }
  scope :this_tuesday, -> { where(delivery_date: Time.now.beginning_of_week + 1.day..Time.now.beginning_of_week + 2.days) }
  scope :this_wednesday, -> { where(delivery_date: Time.now.beginning_of_week + 2.days..Time.now.beginning_of_week + 3.day) }
  scope :this_thursday, -> { where(delivery_date: Time.now.beginning_of_week + 3.days..Time.now.beginning_of_week + 4.days) }
  scope :this_friday, -> { where(delivery_date: Time.now.beginning_of_week + 4.days..Time.now.beginning_of_week + 5.days) }

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
