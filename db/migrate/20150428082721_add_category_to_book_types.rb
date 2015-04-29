class AddCategoryToBookTypes < ActiveRecord::Migration
  def change
    add_reference :book_types, :category, index: true, foreign_key: true
  end
end
