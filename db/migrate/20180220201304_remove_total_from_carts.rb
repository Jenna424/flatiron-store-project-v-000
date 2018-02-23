class RemoveTotalFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :total
  end
end
