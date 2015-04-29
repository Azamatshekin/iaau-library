class Reader < ActiveRecord::Base
  belongs_to :user
  has_many :book_in_uses, :dependent => :destroy
  validates :name, presence: true, length: {maximum: 50, minimum: 1}
  validates :surname, presence: true, length: {maximum: 50, minimum: 1}
  validates :user_id, presence: true,
            uniqueness: { case_sensitive: false }
end
