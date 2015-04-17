class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :barcode
      t.string :INNcode

      t.timestamps null: false
    end
  end
end
