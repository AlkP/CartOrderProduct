class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string  :name,    index: true,  null: false
      t.decimal :price,   default: 0,   null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
