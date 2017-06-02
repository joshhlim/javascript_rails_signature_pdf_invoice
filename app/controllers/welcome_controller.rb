class WelcomeController < ApplicationController
  def index
    @invoices = Invoice.this_week.not_delivered
    puts "***************\n\n"
    puts params
  end

  def monday
    # @invoices = Invoice.insert class method here
  end

  def tuesday
    # @invoices = Invoice.insert class method here
  end

  def wednesday
    # @invoices = Invoice.insert class method here
  end

  def thursday
    # @invoices = Invoice.insert class method here
  end

  def friday
    # @invoices = Invoice.insert class method here
  end

end
