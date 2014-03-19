class AddCustomerIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_id, :integer

    Sale.reset_column_information
    Sale.all.each do |sale|
      customer = sale.customer_and_account_no.split(' ')
      customer[1].gsub!(/\(|\)/, '')

      new_customer = Customer.find_by(name: customer[0])
      sale.customer_id = new_customer.id
      sale.save
    end
  end

  def down
    remove_column :sales, :customer_id
  end
end
