class DataFile < ActiveRecord::Base
  belongs_to :category

  def self.saveFile(upload, name)
    directory = "public/digital_books"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

  def self.search(search)
    if search
      search = search.to_s.upcase
      self.joins(:category).where(" upper(data_files.name) like ? or upper(categories.name) like ? ", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end
