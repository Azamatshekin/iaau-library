class AddNameToDataFile < ActiveRecord::Migration
  def change
    add_column :data_files, :name, :string
  end
end
