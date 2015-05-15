class BookType < ActiveRecord::Base
  belongs_to :category
  has_many :books, :dependent => :destroy

  def self.search(search)
    if search
      self.joins(:category).where("book_types.name like ? or author like ? or publish_year like ? or categories.name like ? or price like ?",
                                   "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end
