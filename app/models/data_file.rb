class DataFile < ActiveRecord::Base
  def self.saveFile(upload, name)
    directory = "public/digital_books"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

  def self.search(search)
    if search
      self.where("name like ? ", "%#{search}%")
    else
      self.all
    end
  end
end
