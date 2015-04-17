class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :address
      t.string :passport
      t.date :birth_date
      t.string :photo

      t.timestamps null: false
    end
  end
end
