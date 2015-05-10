class BookByProvidersController < ApplicationController
  before_action :set_book_by_provider, only: [:show, :edit, :update, :destroy]
  before_action :user_library, only: [:new, :edit, :update, :destroy]

  # GET /book_by_providers
  # GET /book_by_providers.json
  def index
    @book_by_providers = BookByProvider.all
  end

  # GET /book_by_providers/1
  # GET /book_by_providers/1.json
  def show
  end

  # GET /book_by_providers/new
  def new
    @book_by_provider = BookByProvider.new
  end

  # GET /book_by_providers/1/edit
  def edit
  end

  # POST /book_by_providers
  # POST /book_by_providers.json
  def create
    @book_by_provider = BookByProvider.new(book_by_provider_params)

    respond_to do |format|
      if @book_by_provider.save
        format.html { redirect_to @book_by_provider, notice: 'Book by provider was successfully created.' }
        format.json { render :show, status: :created, location: @book_by_provider }
      else
        format.html { render :new }
        format.json { render json: @book_by_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_by_providers/1
  # PATCH/PUT /book_by_providers/1.json
  def update
    respond_to do |format|
      if @book_by_provider.update(book_by_provider_params)
        format.html { redirect_to @book_by_provider, notice: 'Book by provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_by_provider }
      else
        format.html { render :edit }
        format.json { render json: @book_by_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_by_providers/1
  # DELETE /book_by_providers/1.json
  def destroy
    @book_by_provider.destroy
    respond_to do |format|
      format.html { redirect_to book_by_providers_url, notice: 'Book by provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_by_provider
      @book_by_provider = BookByProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_by_provider_params
      params.require(:book_by_provider).permit(:date)
    end
end
