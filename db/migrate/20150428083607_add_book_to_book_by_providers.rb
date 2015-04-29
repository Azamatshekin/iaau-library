class AddBookToBookByProviders < ActiveRecord::Migration
  def change
    add_reference :book_by_providers, :book, index: true, foreign_key: true
  end
end
