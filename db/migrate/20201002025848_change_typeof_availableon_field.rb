class ChangeTypeofAvailableonField < ActiveRecord::Migration[6.0]
  def up
    change_column :products, :available_on, :string
  end

  def down
    change_column :products, :available_on, :datetime
  end
end
