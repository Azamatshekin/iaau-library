class Category < ActiveRecord::Base
  has_many :book_types, :dependent => :destroy
  has_many :data_files
end
