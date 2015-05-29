class BookInUsesController < ApplicationController
  before_action :set_book_in_use, only: [:show, :edit, :update, :destroy]
  before_action :user_library, only: [:new, :create, :return_book]
  before_action :user_admin, only: [:not_returned_report]
  before_action :user_admin_or_library, only: [:show, :edit, :update, :destroy, :history, :index]

  # GET /book_in_uses
  # GET /book_in_uses.json
  def index
    @book_in_uses = BookInUse.search(params[:search]).paginate(page: params[:page], :per_page => 8)
  end

  def history
    @book_in_uses = BookInUse.searchAll(params[:search]).paginate(page: params[:page], :per_page => 8)
  end


  def return_book
    id = params[:book_in_use_id]
    b = BookInUse.find id
    b.returnDate=Time.now
    if b.save
      book = Book.find b.book.id
      book.status_id=1
      if book.save
        message = b.book.book_type.name+ " is returned"
        flash[:success] = message
      else
        message = " Error occured while returning book "
        flash[:success] = message
      end
    else
      message = " Error occured while returning book "
      flash[:success] = message
    end
    redirect_to book_in_uses_path
  end

  def not_returned_report
    @book_in_uses = BookInUse.search_not_returned(params[:search]).paginate(page: params[:page], :per_page => 10)
  end

  # GET /book_in_uses/1
  # GET /book_in_uses/1.json
  def show
  end

  # GET /book_in_uses/new
  def new
    @book_in_use = BookInUse.new
    @books = Book.where("books.status_id = 1")
    @readers = Reader.joins(:user).where("users.role = 1")
  end

  # GET /book_in_uses/1/edit
  def edit
    @books = Book.where("books.status_id = 1")
    @readers = Reader.joins(:user).where("users.role = 1")
  end

  # POST /book_in_uses
  # POST /book_in_uses.json
  def create
    @books = Book.where("books.status_id = 1")
    @readers = Reader.joins(:user).where("users.role = 1")
    @book_in_use = BookInUse.new(book_in_use_params)

    respond_to do |format|
      if @book_in_use.save
        book = Book.find @book_in_use.book.id
        book.status_id=2
        book.save
        format.html { redirect_to @book_in_use, notice: 'Book in use was successfully created.' }
        format.json { render :show, status: :created, location: @book_in_use }
      else
        format.html { render :new }
        format.json { render json: @book_in_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_in_uses/1
  # PATCH/PUT /book_in_uses/1.json
  def update
    @books = Book.where("books.status_id = 1")
    @readers = Reader.joins(:user).where("users.role = 1")
    respond_to do |format|
      if @book_in_use.update(book_in_use_params)
        format.html { redirect_to @book_in_use, notice: 'Book in use was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_in_use }
      else
        format.html { render :edit }
        format.json { render json: @book_in_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_in_uses/1
  # DELETE /book_in_uses/1.json
  def destroy
    @book_in_use.destroy
    respond_to do |format|
      format.html { redirect_to book_in_uses_url, notice: 'Book in use was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_in_use
      @book_in_use = BookInUse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_in_use_params
      params.require(:book_in_use).permit(:fromDate, :toDate, :returnDate, :book_id, :reader_id)
    end
end
