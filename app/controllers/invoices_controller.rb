class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoices_params)
    if @invoice.save
      redirect_to users_invoices_path
    else
      render 'new'
    end
  end



  private

  def invoices_params
    params.require(:invoices).permit(:store_name, :total)
  end
end
