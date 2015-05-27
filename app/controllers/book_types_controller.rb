class BookTypesController < ApplicationController
  before_action :set_book_type, only: [:show, :edit, :update, :destroy]
  before_action :user_library, only: [:new, :edit, :show, :create, :update, :destroy, :index]
  before_action :user_admin, only: [:books_report]

  # GET /book_types
  # GET /book_types.json
  def index
    @book_types = BookType.search(params[:search]).paginate(page: params[:page], :per_page => 10)
  end

  def books_report
    @book_types = BookType.search_report(params[:search]).paginate(page: params[:page], :per_page => 10)
  end

  # GET /book_types/1
  # GET /book_types/1.json
  def show
  end

  # GET /book_types/new
  def new
    @book_type = BookType.new
    @categories = Category.all
  end

  # GET /book_types/1/edit
  def edit
    @categories = Category.all
  end

  # POST /book_types
  # POST /book_types.json
  def create
    @categories = Category.all
    @book_type = BookType.new(book_type_params)

    respond_to do |format|
      if @book_type.save
        format.html { redirect_to @book_type, notice: 'Book type was successfully created.' }
        format.json { render :show, status: :created, location: @book_type }
      else
        format.html { render :new }
        format.json { render json: @book_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_types/1
  # PATCH/PUT /book_types/1.json
  def update
    @categories = Category.all
    respond_to do |format|
      if @book_type.update(book_type_params)
        format.html { redirect_to @book_type, notice: 'Book type was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_type }
      else
        format.html { render :edit }
        format.json { render json: @book_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_types/1
  # DELETE /book_types/1.json
  def destroy
    @book_type.destroy
    respond_to do |format|
      format.html { redirect_to book_types_url, notice: 'Book type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_type
      @book_type = BookType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_type_params
      params.require(:book_type).permit(:name, :author, :publish_year, :price, :category_id)
    end
end
