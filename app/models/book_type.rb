class BookType < ActiveRecord::Base
  belongs_to :category
  has_many :books, :dependent => :destroy

  def self.search(search)
    if search
      search = search.to_s.upcase
      self.joins(:category).where("book_types.name like upper(?) or author like upper(?) or publish_year like ? or categories.name like upper(?) or price like ?",
                                   "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end
