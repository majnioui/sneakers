class RemoveUntiPriceFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :unti_price, :decimal
  end
end
