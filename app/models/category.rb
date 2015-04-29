class Category < ActiveRecord::Base
  has_many :book_types, :dependent => :destroy
end
