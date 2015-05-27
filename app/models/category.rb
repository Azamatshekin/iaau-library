class Category < ActiveRecord::Base
  has_many :book_types, :dependent => :destroy
  has_many :data_files
  validates :name, presence: true, length: {maximum: 80, minimum: 2}
end
