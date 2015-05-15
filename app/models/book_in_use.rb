class BookInUse < ActiveRecord::Base
  belongs_to :book
  belongs_to :reader


  def self.search(search)
    if search
      self.joins(:book, :reader).where("readers.name like? or readers.surname like ? or books.barcode like ? or fromDate like ? or toDate like ?",
                                   "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
  def self.search_not_returned(search)
    if search
      self.joins(:book, :reader).where("(readers.name like? or readers.surname like ? or books.barcode like ? or fromDate like ?) and toDate < ? and returnDate=?",
                                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", Time.now, nil)
    else
      self.where("toDate < ? and returnDate=?", Time.now, nil)
    end
  end
end
