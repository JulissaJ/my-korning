class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer

    Sale.find_each do |sale|
      employee = sale.employee.split(' ')
      employee[2].gsub!(/\(|\)/, '')

      Sale.reset_column_information
      new_employee = Employee.find_by(email: employee[2])
      sale.employee_id = new_employee.id
      sale.save
    end
  end

  def down
    remove_column :sales, :employee_id
  end
end
