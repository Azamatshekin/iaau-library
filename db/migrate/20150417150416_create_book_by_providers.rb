class CreateBookByProviders < ActiveRecord::Migration
  def change
    create_table :book_by_providers do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
