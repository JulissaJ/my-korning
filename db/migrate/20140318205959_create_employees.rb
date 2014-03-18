class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    Sale.find_each do |sale|
      employee = sale.employee.split(' ')
      employee[2].gsub!(/\(|\)/, '')

      Employee.find_or_create_by(
        first_name: employee[0],
        last_name: employee[1],
        email: employee[2]
      )
    end
  end

  def down
    drop_table :employees
  end
end
