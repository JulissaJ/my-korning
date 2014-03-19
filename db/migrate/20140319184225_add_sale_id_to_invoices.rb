class AddSaleIdToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :sale_id, :integer

    Sale.reset_column_information
    Invoice.reset_column_information

    Invoice.find_each do |invoice|
      sale = Sale.find_by(invoice_id: invoice.id)
      invoice.sale_id = sale.id
      invoice.save
    end
  end

  def down
    remove_column :invoices, :sale_id
  end
end
