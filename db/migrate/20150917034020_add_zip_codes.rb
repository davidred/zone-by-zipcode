class AddZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :value, null: false, limit: 5
      t.integer :state_id, null: false
      t.timestamps
    end

    add_index :zip_codes, :value
    add_index :zip_codes, :state_id
  end
end