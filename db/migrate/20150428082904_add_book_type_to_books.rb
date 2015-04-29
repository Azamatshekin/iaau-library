class AddBookTypeToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :book_type, index: true, foreign_key: true
  end
end
