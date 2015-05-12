class UploadController < ApplicationController
  def upload_page
  end

  def index
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
  def cleanup
    File.delete("#{RAILS_ROOT}/dirname/#{@filename}")  if File.exist?("#{RAILS_ROOT}/dirname/#{@filename}")
  end


  def pdf
    directory = "public/digital_books"
    send_file Rails.root.join(directory, '1.Mathematical Modeling and Simulation.pdf'), :type=>"application/pdf", :x_sendfile=>true
  end

  def allBooks
    files = Dir.glob("#{Rails.root}/private/**/*")
  end
end
