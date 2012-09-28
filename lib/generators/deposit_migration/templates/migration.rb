class DepositMigration < ActiveRecord::Migration
  def change
    create_table :deposit_slots do |t|
      t.integer :item_id
      t.string :item_type

      t.string :key
      t.text :data

      t.timestamps
    end

    add_index :deposit_slots, [:item_id, :item_type, :key]
  end
end
