class AddCategoryToDataFile < ActiveRecord::Migration
  def change
    add_reference :data_files, :category, index: true, foreign_key: true
  end
end
