class Reader < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: {maximum: 50, minimum: 1}
  validates :surname, presence: true, length: {maximum: 50, minimum: 1}
  validates :user_id, presence: true,
            uniqueness: { case_sensitive: false }
end
