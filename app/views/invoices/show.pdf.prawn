prawn_document do |pdf|

  # Assign the path to your file name first to a local variable.
logopath = "#{Rails.root.join("app/assets/images/stevescoffee.png")}"

# Displays the image in your PDF. Dimensions are optional.

  pdf.image logopath, :width => 280, :height => 70
  pdf.move_down 50
  pdf.text "Invoice:                     \##{@invoice.id}"
  pdf.move_down 25
  pdf.text "Customer:                 #{@invoice.customer}"
  pdf.move_down 25
  pdf.text "Amount:                     $#{number_with_precision(@invoice.amount, precision: 2)}"
  pdf.move_down 25
  pdf.text "Order Date:               #{@invoice.created_at.strftime("%B %d, %Y")}"
  pdf.move_down 25
  pdf.text "Delivery Date:           #{@invoice.delivery_date.strftime("%B %d, %Y")}"
  pdf.move_down 25
  pdf.text "Delivery Address:      #{@invoice.address}"
  pdf.move_down 25
  pdf.text "Signature:"
  pdf.move_down 20


  if @sig
    pdf.image(@sig, :width => 400, :height => 100)
  end


  pdf.text "<u><link href='/invoices/#{@invoice.id}'>Back</link></u>", :inline_format => true

end
