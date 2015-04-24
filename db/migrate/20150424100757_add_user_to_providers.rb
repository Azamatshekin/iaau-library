class AddUserToProviders < ActiveRecord::Migration
  def change
    add_reference :providers, :user, index: true, foreign_key: true
  end
end
