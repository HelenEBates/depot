class AddProductPriceToLineItems < ActiveRecord::Migration[6.0]
  def up
    add_column :line_items, :product_price, :decimal, precision: 8, scale: 2
    execute "UPDATE line_items
             SET product_price =
              ( select price from products
                where products.id = line_items.product_id
              );"
  end

  def down
    remove_column :line_items, :product_price, :decimal, precision: 8, scale: 2
  end
end
