class ClassPagesController < ApplicationController
  before_action :set_class_page, only: [:show, :edit, :update, :destroy]

  # GET /class_pages
  # GET /class_pages.json
  def index
    @class_pages = ClassPage.order("order_position ASC").all
  end

  # GET /class_pages/1
  # GET /class_pages/1.json
  def show
    @class_pages = ClassPage.order("order_position ASC").all
    #@class_pages = ClassPage.order("order_position ASC").all
  end

  # GET /class_pages/new
  def new
    @class_page = ClassPage.new
  end

  # GET /class_pages/1/edit
  def edit

  end

  # POST /class_pages
  # POST /class_pages.json
  def create
    @class_page = ClassPage.new(class_page_params)

    respond_to do |format|
      if @class_page.save
        format.html { redirect_to @class_page, notice: 'Class page was successfully created.' }
        format.json { render :show, status: :created, location: @class_page }
      else
        format.html { render :new }
        format.json { render json: @class_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_pages/1
  # PATCH/PUT /class_pages/1.json
  def update
    respond_to do |format|
      if @class_page.update(class_page_params)
        format.html { redirect_to @class_page, notice: 'Class page was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_page }
      else
        format.html { render :edit }
        format.json { render json: @class_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_pages/1
  # DELETE /class_pages/1.json
  def destroy
    @class_page.destroy
    respond_to do |format|
      format.html { redirect_to class_pages_url, notice: 'Class page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_page
      @class_page = ClassPage.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_page_params
      params.require(:class_page).permit(:class_title, :class_photo, :class_content, :order_position)
    end
end
