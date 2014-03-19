class MakeForiegnIdsNotNull < ActiveRecord::Migration
  def up
    change_column :sales, :employee_id, :integer, null: false
    change_column :sales, :customer_id, :integer, null: false
    change_column :sales, :product_id, :integer, null: false
    change_column :sales, :invoice_id, :integer, null: false

    change_column :invoices, :amount_due, :decimal, null: false
    change_column :invoices, :invoice_number, :integer, null: false
  end

  def down
    change_column :sales, :employee_id, :integer, null: true
    change_column :sales, :customer_id, :integer, null: true
    change_column :sales, :product_id, :integer, null: true
    change_column :sales, :invoice_id, :integer, null: true

    change_column :invoices, :amount_due, :decimal, null: true
    change_column :invoices, :invoice_number, :integer, null: true
  end
end
