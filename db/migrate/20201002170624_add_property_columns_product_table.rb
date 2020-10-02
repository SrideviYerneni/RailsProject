class AddPropertyColumnsProductTable < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :property_name, :string
    add_column :products, :property_value, :string
  end
end
