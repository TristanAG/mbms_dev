class ClassPagesController < ApplicationController
  before_action :set_class_page, only: [:show, :edit, :update, :destroy]
  before_action :load_widgets
  before_action :load_class_pages, only: [:index, :admin, :schedule, :show]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
  end

  def admin

    load_students

    if !user_signed_in?
      redirect_to root_path
    end

  end

  def show
    session[:class_title] = @class_page.class_title
  end

  def schedule

    @current_months_classes = ClassPage.where(start_time: Time.current.beginning_of_month..Time.current.end_of_month)

    #recurring_class_refs currently returns 2 events, taco tuesday, and drop-in meditation
    @recurring_class_refs = ClassPage.all.where(:recurring_event => true)

    @collection = []



    #i need this to loop 31 times, which it's doing
    (Time.current.beginning_of_month.day..Time.current.end_of_month.day).each do

      #on each pass i need to run another pass
      #ok, it's fuckin up because i'm checking it agains today i think
      #that's why it's only returning the dates on thursday
      #so what kind of loop is needed then? As I loop through each day of the month, I need to check if the current day
      #in the loop is the same day as one of the recurring_refs day. That makes sense



      @recurring_class_refs.each do |class_page|
        #if the current day (today) == the day of the given recurring_class_ref
        if Time.current.strftime('%A') == class_page.start_time.strftime('%A')
          @collection << class_page
        end
      end
    end

    @all_classes = @current_months_classes + @collection
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
    params.require(:class_page).permit(:start_time, :class_title, :recurring_event, :class_photo, :class_content, :order_position)
  end

end
