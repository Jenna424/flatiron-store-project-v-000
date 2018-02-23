class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, :default => "not submitted"
    end
  end
end
