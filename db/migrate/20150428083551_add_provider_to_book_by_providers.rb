class AddProviderToBookByProviders < ActiveRecord::Migration
  def change
    add_reference :book_by_providers, :provider, index: true, foreign_key: true
  end
end
