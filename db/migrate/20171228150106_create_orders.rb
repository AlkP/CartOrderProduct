class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :cart,     index: true
      t.references :product

      t.timestamps
    end
  end
end
