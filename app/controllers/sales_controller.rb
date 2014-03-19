class SalesController < ApplicationController

  def index
    @sales = Sale.where(sale_date: "10/01/2012".."12/31/2012")
  end

end
