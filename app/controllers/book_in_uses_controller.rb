class BookInUsesController < ApplicationController
  before_action :set_book_in_use, only: [:show, :edit, :update, :destroy]
  before_action :user_library, only: [:new, :edit, :update, :destroy]

  # GET /book_in_uses
  # GET /book_in_uses.json
  def index
    @book_in_uses = BookInUse.all
  end

  # GET /book_in_uses/1
  # GET /book_in_uses/1.json
  def show
  end

  # GET /book_in_uses/new
  def new
    @book_in_use = BookInUse.new
    @books = Book.all
    @readers = Reader.joins(:user).where("users.role = 1").paginate(page: params[:page])
  end

  # GET /book_in_uses/1/edit
  def edit
    @readers = Reader.all
    @books = Book.all
  end

  # POST /book_in_uses
  # POST /book_in_uses.json
  def create
    @book_in_use = BookInUse.new(book_in_use_params)

    respond_to do |format|
      if @book_in_use.save
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
