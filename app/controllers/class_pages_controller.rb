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
  end

  def edit
  end

  def new
    @class_page = ClassPage.new
  end

  def create

  #create all initial values
    @class_page = ClassPage.new(class_page_params)
    start_date = @class_page.start_time
    increment_amount = 7

    year = start_date.year
    month_num = start_date.month
    day_num = start_date.day
    day_of_week = start_date.strftime('%A')
    last_day_of_month = start_date.end_of_month.day
    new_day_num = nil
  #determine the actual date of the first instance of that day and update it
    (0..6).each do |i|
      if day_of_week == Date::DAYNAMES[i]
        new_day_num = i + 1
        @class_page.update({start_time: @class_page.start_time.change(day: new_day_num)})
        break
      end
    end

  #1..10 is a random set to test 10 posts and how it acts
    (1..30).each do
      new_day_num += increment_amount
  #so this represents the edge case
      if new_day_num <= last_day_of_month
        @next_class_instance = ClassPage.new(class_page_params)
        @next_class_instance.update({start_time: @next_class_instance.start_time.change(month: month_num, day: new_day_num)})

      elsif new_day_num > last_day_of_month
        #determine the new month and day
        diff = last_day_of_month - (new_day_num - increment_amount)
        first_instance_next_month = increment_amount - diff
        month_num += 1

        @next_class_instance = ClassPage.new(class_page_params)
        @next_class_instance.update({start_time: @next_class_instance.start_time.change(month: month_num, day: first_instance_next_month)})

        #now you need to get the day nums incrementing correctly again
        new_day_num = first_instance_next_month
        #and update the last day of the month
        last_day_of_month = @next_class_instance.start_time.end_of_month.day
      end
    end










    #check if proposed date is valid


    #if valid, post and increment

    #if not, make valid, resume loop




    # respond_to do |format|
    #   if @class_page.save
    #     format.html { redirect_to @class_page, notice: 'Class page was successfully created.' }
    #     format.json { render :show, status: :created, location: @class_page }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @class_page.errors, status: :unprocessable_entity }
    #   end
    # end
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
