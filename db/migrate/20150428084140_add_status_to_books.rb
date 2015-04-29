class AddStatusToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :status, index: true, foreign_key: true
  end
end
