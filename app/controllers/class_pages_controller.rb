class ClassPagesController < ApplicationController
  before_action :set_class_page, only: [:show, :edit, :update, :destroy]
  before_action :load_widgets
  before_action :load_class_pages, only: [:index, :admin, :schedule, :show]

  def index
  end

  def admin
  end

  def show
    flash[:class_title] = @class_page.class_title
  end

  def schedule
  end

  def edit
  end

  def new
    @class_page = ClassPage.new
  end

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

  def destroy
    @class_page.destroy
    respond_to do |format|
      format.html { redirect_to class_pages_url, notice: 'Class page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_class_page
    @class_page = ClassPage.friendly.find(params[:id])
  end

  def load_class_pages
    @class_pages = ClassPage.order("order_position ASC").all
  end

  def class_page_params
    params.require(:class_page).permit(:start_time, :class_title, :class_photo, :class_content, :order_position)
  end

end
