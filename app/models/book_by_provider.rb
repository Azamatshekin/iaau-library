class BookByProvider < ActiveRecord::Base
  belongs_to :book
  belongs_to :provider
end
