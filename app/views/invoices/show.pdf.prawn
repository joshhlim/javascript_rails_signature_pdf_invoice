prawn_document do |pdf|
  pdf.text "INVOICE FOR CHARGE \##{@invoice.id}"
  pdf.move_down 50
  pdf.text ""
  pdf.move_down 30
  pdf.text "Date             #{@invoice.created_at}"
  pdf.move_down 30
  pdf.text "Product         #{@invoice.product}"
  pdf.move_down 30
  pdf.text "Amount         $#{number_with_precision(@invoice.amount, precision: 2)}"
  pdf.move_down 50
  pdf.text "Signature:"
  pdf.move_down 20

  pdf.image(@sig, :width => 400, :height => 100)
end