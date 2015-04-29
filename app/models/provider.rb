class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :book_by_providers, :dependent => :destroy
end
