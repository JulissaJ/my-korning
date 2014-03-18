class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end

    Sale.find_each do |sale|
      Product.find_or_create_by(
        name: sale.product_name
      )
    end
  end
end
