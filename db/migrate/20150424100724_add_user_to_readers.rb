class AddUserToReaders < ActiveRecord::Migration
  def change
    add_reference :readers, :user, index: true, foreign_key: true
  end
end
