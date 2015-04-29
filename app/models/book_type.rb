class BookType < ActiveRecord::Base
  belongs_to :category
  has_many :books, :dependent => :destroy
end
