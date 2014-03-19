class AddInvoiceIdToSale < ActiveRecord::Migration
  def up
    add_column :sales, :invoice_id, :integer

    Sale.reset_column_information

    Sale.all.each do |sale|
      invoice = Invoice.find_by(invoice_number: sale.invoice_no )
      sale.invoice_id = invoice.id
      sale.save
    end
  end

  def down
    remove_column :sales, :invoice_id
  end
end
