class AddReaderToBookInUses < ActiveRecord::Migration
  def change
    add_reference :book_in_uses, :reader, index: true, foreign_key: true
  end
end
