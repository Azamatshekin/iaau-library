class AddShelfNumberToBooks < ActiveRecord::Migration
  def change
    remove_column :books, :INNcode
    add_column :books, :shelf_number, :string
  end
end
