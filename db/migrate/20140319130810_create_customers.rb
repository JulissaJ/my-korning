class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :account_no
      t.string :name
      t.string :website

      t.timestamps
    end

    Sale.find_each do |sale|
      customer = sale.customer_and_account_no.split(' ')
      customer[1].gsub!(/\(|\)/, '')

      Customer.find_or_create_by(
        name: customer[0],
        account_no: customer[1],
        website: "http://www.#{customer[0].downcase}.com"
      )
    end
  end

  def down
    drop_table :customers
  end
end
