class CreateBookTypes < ActiveRecord::Migration
  def change
    create_table :book_types do |t|
      t.string :name
      t.string :author
      t.date :publish_year
      t.float :price

      t.timestamps null: false
    end
  end
end
