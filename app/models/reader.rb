class Reader < ActiveRecord::Base
  belongs_to :user
  has_many :book_in_uses, :dependent => :destroy
  mount_uploader :photo, PictureUploader
  validates :name, presence: true, length: {maximum: 50, minimum: 1}
  validates :surname, presence: true, length: {maximum: 50, minimum: 1}
  validates :user_id, presence: true,
            uniqueness: { case_sensitive: false }
  validate  :picture_size


  def self.search(search)
    if search
      search = search.to_s.upcase
      self.joins(:user).where("(upper(name) like ? or upper(surname) like ?) and users.role = 1", "%#{search}%", "%#{search}%")
    else
      self.joins(:user).where("users.role = 1")
    end
  end
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if photo.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
