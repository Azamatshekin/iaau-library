class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :only_own_edit, only: [:show, :edit, :update]

  # GET /readers
  # GET /readers.json
  def index
    @readers = Reader.search(params[:search]).paginate(page: params[:page], :per_page => 10)
  end

  # GET /readers/1
  # GET /readers/1.json
  def show
  end

  def show_books
    @book_in_uses= current_user.reader.book_in_uses
  end

  def show_books_by_reader
    id = params[:reader_id]
    @reader1 = Reader.find id
    @book_in_uses= @reader1.book_in_uses
  end


  # GET /readers/new
  def new
    @reader = Reader.new
  end

  # GET /readers/1/edit
  def edit
  end

  # POST /readers
  # POST /readers.json
  def create
    @reader = Reader.new(reader_params)
    @reader.user = current_user
    respond_to do |format|
      if @reader.save
        format.html { redirect_to @reader, notice: 'Reader was successfully created.' }
        format.json { render :show, status: :created, location: @reader }
      else
        format.html { render :new }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readers/1
  # PATCH/PUT /readers/1.json
  def update
    respond_to do |format|
      if @reader.update(reader_params)
        format.html { redirect_to @reader, notice: 'Reader was successfully updated.' }
        format.json { render :show, status: :ok, location: @reader }
      else
        format.html { render :edit }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers/1
  # DELETE /readers/1.json
  def destroy
    @reader.destroy
    respond_to do |format|
      format.html { redirect_to readers_url, notice: 'Reader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reader
      @reader = Reader.find(params[:id])
    end

    def only_own_edit

      unless current_user.reader.id==@reader.id
        store_location
        flash[:danger] = "You cannot open other profiles."
        redirect_to access_denied_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reader_params
      params.require(:reader).permit(:name, :surname, :email, :address, :passport, :birth_date, :photo)
    end
end
