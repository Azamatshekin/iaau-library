class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :fullname
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
