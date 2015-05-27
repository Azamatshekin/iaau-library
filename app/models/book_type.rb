class BookType < ActiveRecord::Base
  belongs_to :category
  has_many :books, :dependent => :destroy

  validates :name, presence: true, length: {maximum: 80, minimum: 2}
  validates :author, presence: true, length: {maximum: 50, minimum: 1}
  validates :price, presence: true

  def self.search(search)
    if search
      search = search.to_s.upcase
      self.joins(:category).where("upper(book_types.name) like ? or upper(author) like ? or publish_year like ? or upper(categories.name) like ? or price like ?",
                                   "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
  
end
