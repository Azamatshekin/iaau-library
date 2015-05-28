class BookInUse < ActiveRecord::Base
  belongs_to :book
  belongs_to :reader
  validates :fromDate, presence: true
  validates :toDate, presence: true
  validates :book_id, presence: true
  validates :reader_id, presence: true


  def self.search(search)
    if search
      search = search.to_s.upcase
      self.joins(:book, :reader).where(" returnDate is ? and ( upper(readers.name) like ? or upper(readers.surname) like ? or upper(books.barcode) like ? or fromDate like ? or toDate like ? )",
                                       nil, "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.joins(:book, :reader).where(" returnDate is ? ", nil)
    end
  end

  def self.searchAll(search)
    if search
      search = search.to_s.upcase
      self.joins(:book, :reader).where("upper(readers.name) like ? or upper(readers.surname) like ? or upper(books.barcode) like ? or fromDate like ? or toDate like ?",
                                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
  def self.search_not_returned(search)
    if search
      search = search.to_s.upcase
      self.joins(:book, :reader).where("(upper(readers.name) like ? or upper(readers.surname) like ? or upper(books.barcode) like ? or fromDate like ?) and toDate < ? and returnDate is ?",
                                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", Time.now, nil)
    else
      self.joins(:book, :reader).where("toDate < ? and returnDate is ?", Time.now, nil)
    end
  end
end
