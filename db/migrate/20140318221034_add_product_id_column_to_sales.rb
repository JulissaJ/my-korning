class AddProductIdColumnToSales < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer
    Sale.reset_column_information

    Sale.all.each do |sale|
      product = Product.find_by(name: sale.product_name)
      sale.product_id = product.id
      sale.save
    end
  end

  def down
    remove_column :sales, :product_id
  end
end
