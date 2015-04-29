class AddBookToBookInUses < ActiveRecord::Migration
  def change
    add_reference :book_in_uses, :book, index: true, foreign_key: true
  end
end
