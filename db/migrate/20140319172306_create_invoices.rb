class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :amount_due, precision: 20, scale: 2
      t.integer :invoice_number

      t.timestamps
    end

    Sale.find_each do |sale|
      if sale.invoice_frequency == "Quarterly"
        freq = 4
      elsif sale.invoice_frequency == "Monthly"
        freq = 12
      else
        freq = 1
      end

      Invoice.find_or_create_by(
        amount_due: sale.sale_amount/freq,
        invoice_number: sale.invoice_no
      )
    end

  end
end
