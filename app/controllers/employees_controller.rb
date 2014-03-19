class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @sales = Sale.where(employee_id: @employee.id).order("sale_amount DESC")

    @total_sales = 0
    @product_count = {}

    @sales.each do |sale|
      @total_sales += sale.sale_amount
      if @product_count.include?(sale.product.name)
        @product_count[sale.product.name]+= 1
      else
        @product_count[sale.product.name] = 1
      end
    end

    @product_count = @product_count.sort_by{
      |key, value| value
    }.pop[0]

  end

end
