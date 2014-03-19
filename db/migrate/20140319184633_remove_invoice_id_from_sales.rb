class RemoveInvoiceIdFromSales < ActiveRecord::Migration
  def up
    change_column :invoices, :sale_id, :integer, null: false

    remove_column :sales, :invoice_id
  end

  def down
    change_column :invoices, :sale_id, :integer, null: true

    add_column :sales, :invoice_id, :integer
  end
end
