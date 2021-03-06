class BasicPagesController < ApplicationController
  before_action :load_widgets
  before_action :set_basic_page, only: [:show, :edit, :update, :destroy]


  # GET /basic_pages
  # GET /basic_pages.json
  def index
    @basic_pages = BasicPage.all
  end

  # GET /basic_pages/1
  # GET /basic_pages/1.json
  def show
    @basic_pages = BasicPage.all
  end

  # GET /basic_pages/new
  def new
    @basic_page = BasicPage.new
  end

  # GET /basic_pages/1/edit
  def edit
  end

  # POST /basic_pages
  # POST /basic_pages.json
  def create
    @basic_page = BasicPage.new(basic_page_params)

    respond_to do |format|
      if @basic_page.save
        format.html { redirect_to @basic_page, notice: 'Basic page was successfully created.' }
        format.json { render :show, status: :created, location: @basic_page }
      else
        format.html { render :new }
        format.json { render json: @basic_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_pages/1
  # PATCH/PUT /basic_pages/1.json
  def update
    respond_to do |format|
      if @basic_page.update(basic_page_params)
        format.html { redirect_to @basic_page, notice: 'Basic page was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic_page }
      else
        format.html { render :edit }
        format.json { render json: @basic_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_pages/1
  # DELETE /basic_pages/1.json
  def destroy
    @basic_page.destroy
    respond_to do |format|
      format.html { redirect_to basic_pages_url, notice: 'Basic page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_page
      @basic_page = BasicPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_page_params
      params.require(:basic_page).permit(:page_title, :page_content)
    end
end
