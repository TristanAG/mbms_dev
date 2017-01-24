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

    #building the recurring class feature
    #-----#
    @class_page = ClassPage.new(class_page_params)

    day_of_week = @class_page.start_time.strftime('%A')
    first_day_of_year = Time.current.beginning_of_year

    #loop -1 thru 5 to check the days here
    #basically loop through the first instance of each weekday to find a match
    #this function takes a class and posts the first instance of the year

    #perhaps this should be an until loop
    (first_day_of_year.day - 1..first_day_of_year.day + 5).each do |i|
      #given the set weekday of the event, post to the first instance that event will occur in the given year
      if day_of_week == Date::DAYNAMES[i]
        actual_day_num = i + 1
        @class_page.update({start_time: @class_page.start_time.change(day: actual_day_num)})
        #temp_date_update = @class_page.start_time
        increment_amount = actual_day_num + 7

        (1..4).each do |i|

          #like up here make a break condition for if increment_amount > DAYS_IN_CURRENT_MONTH

          if increment_amount < 31

            @new_class_instance = ClassPage.new(class_page_params)

            new_start_time = Date.new(
              @class_page.start_time.strftime('%Y').to_i,
              @class_page.start_time.strftime('%m').to_i,
              @class_page.start_time.strftime('%d').to_i + increment_amount
              )
            #new_start_time = @class_page.start_time + first_start_time
            @new_class_instance.update({start_time: new_start_time})
            increment_amount += 7

          end
        end
      
    #-----#






    # first_day_of_the_year.beginning_of_week
    #
    # @class_page = ClassPage.new(class_page_params)
    # first_instance_day = @class_page.start_time.strftime('%A')
    #
    #
    #
    # @class_page.update_attribute(:start_time, start)
    # @class_page.save
    #
    # next_day = @class_page.start_time.change(:day, )
    #
    # @class_page = ClassPage.new(class_page_params)
    # @class_page.update_attribute(:start_time, start+7)
    # @class_page.save


    # @class_page.save

    # if @class_page.recurring_event
    #
    #   #next_day = @class_page.start_time.day + 7
    #   start = Time.current.beginning_of_year.day
    #   finish = Time.current.end_of_week.day
    #
    #   next_day = @class_page.start_time.day
    #
    #   (start..finish).each do
    #     @new_instance = ClassPage.new(class_page_params)
    #     @new_instance.update_attribute(:start_time, Date.today + next_day)
    #     next_day = next_day + 1
    #     @new_instance.save



        # @new_class_instance = ClassPage.new(class_page_params)
        # temp_date = @new_class_instance.start_time.change(day: next_day)
        # @new_class_instance.update_attribute(:start_time, temp_date)
        # @new_class_instance.save




        # @new_class_instance = ClassPage.new(class_page_params)
        # temp_date = @new_class_instance.start_time.change(day: next_day)
        # @new_class_instance.update_attribute(:start_time, temp_date)
        # @new_class_instance.save

        #next_day = @new_class_instance.start_time.day + 7





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
