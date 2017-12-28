class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string  :guid,    index: true,  null: false
      t.integer :status,  default: 0,   null: false

      t.timestamps
    end
  end
end
