class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    if params[:day]
      @day = params[:day]
      @invoices = set_invoices(@day)
    else
      @invoices = Invoice.not_delivered.this_week.order(delivery_date: :asc)
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    if @invoice.signature
      @sig = decode_signature(@invoice.signature)
    end

    respond_to do |format|
      format.html
      format.json
      format.pdf
      # format.pdf {
      #   send_data(@invoice.prawn_document,
      #             filename: "#{@invoice.created_at.strftime("%Y-%m-%d")}-stevescoffee-receipt.pdf",
      #             type: "application/pdf",
      #             disposition: :inline
      #             )
      # }
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    # @invoice.assign_attributes()

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(signature_params)
        @invoice.update_attributes(delivered: true)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:amount, :delivery_date, :customer, :address)
    end

    def signature_params
      params.require(:invoice).permit(:signature)
    end

    def decode_signature(encoded_sig)
      StringIO.new(Base64.decode64(encoded_sig.split(',')[1]))
    end

    def set_invoices(selection)
      case selection
        when "List By:"
          Invoice.not_delivered.this_week.order(delivery_date: :asc)
        when "Current Week"
          Invoice.not_delivered.this_week.order(delivery_date: :asc)
        when "Monday"
          Invoice.not_delivered.this_monday.order(delivery_date: :asc)
        when "Tuesday"
          Invoice.not_delivered.this_tuesday.order(delivery_date: :asc)
        when "Wednesday"
          Invoice.not_delivered.this_wednesday.order(delivery_date: :asc)
        when "Thursday"
          Invoice.not_delivered.this_thursday.order(delivery_date: :asc)
        when "Friday"
          Invoice.not_delivered.this_friday.order(delivery_date: :asc)
        when "All Invoices"
          Invoice.all.order(:id)
        when "Undelivered"
          Invoice.not_delivered.order(delivery_date: :asc)
        end
      end
end
