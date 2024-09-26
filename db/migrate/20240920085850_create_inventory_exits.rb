class CreateInventoryExits < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_exits do |t|
      t.references :article, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.integer :quantity
      t.date :exit_date

      t.timestamps
    end
  end
end
