class CreateBookInUses < ActiveRecord::Migration
  def change
    create_table :book_in_uses do |t|
      t.date :fromDate
      t.date :toDate
      t.date :returnDate

      t.timestamps null: false
    end
  end
end
