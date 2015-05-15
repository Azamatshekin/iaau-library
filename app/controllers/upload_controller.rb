class UploadController < ApplicationController
  before_action :logged_in_user, only: [:upload_download_page]
  before_action :user_library, only: [:uploadFile, :deleteDOC, :deletePDF]
  def upload_download_page
    @PDFfiles=Hash.new
    @DOCfiles=Hash.new
    @files = Dir.glob('public/digital_books/*')
    for f in @files
      id = f.to_s.from(21).to_i
      file = DataFile.find id
      if(file.name.include? '.pdf')
        @PDFfiles[id] = file.name
      elsif(file.name.include? '.doc')
         @DOCfiles[id] = file.name
      end
    end
  end

  def index
  end
  def uploadFile
    upload = params[:upload]
    if upload!=nil
      file = DataFile.new
      file.name = upload['datafile'].original_filename
      if file.save
        if(file.name.include? '.pdf')
          post = DataFile.saveFile(upload, file.id.to_s+'.pdf')
          message = "File has been uploaded successfully"
          flash[:success] = message
        elsif(file.name.include? '.doc')
          post = DataFile.saveFile(upload, file.id.to_s+'.doc')
          message = "File has been uploaded successfully"
          flash[:success] = message
        else
          message = "File must be PDF format or DOC format"
          flash[:danger] = message
        end
      else
        message = "Eror while saving file"
        flash[:danger] = message
      end
    else
      message = "No file Selected"
      flash[:danger] = message
    end
    redirect_to upload_upload_download_page_path
  end

  def deletePDF
    name = params[:filename]
    directory = "public/digital_books"
    File.delete(Rails.root.join(directory, name+'.pdf')) if File.file? Rails.root.join(directory, name+'.pdf')
    message = "File deleted successfully"
    flash[:success] = message
    redirect_to upload_upload_download_page_path
  end

  def deleteDOC
    name = params[:filename]
    directory = "public/digital_books"
    File.delete(Rails.root.join(directory, name+'.doc'))
    message = "File deleted successfully"
    flash[:success] = message
    redirect_to upload_upload_download_page_path
  end


  def getPDF
    id = params[:filename]
    file = DataFile.find id
    directory = "public/digital_books"
    send_file Rails.root.join(directory, id+'.pdf'), :filename => file.name, :type=>"application/pdf", :x_sendfile=>true
  end

  def getDOC
    id = params[:filename]
    file = DataFile.find id
    directory = "public/digital_books"
    send_file Rails.root.join(directory, id+'.doc'), :filename => file.name, :type=>"application/doc", :x_sendfile=>true
  end

  def allBooks
    files = Dir.glob("#{Rails.root}/private/**/*")
  end
end
