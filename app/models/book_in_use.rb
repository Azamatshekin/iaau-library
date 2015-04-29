class BookInUse < ActiveRecord::Base
  belongs_to :book
  belongs_to :reader
end
