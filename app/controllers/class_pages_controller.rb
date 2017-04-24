class ClassPagesController < ApplicationController
  before_action :set_class_page, only: [:show, :edit, :update, :destroy]
  before_action :load_widgets
  before_action :load_class_pages, only: [:schedule]
  before_action :load_basic_pages
  before_action :load_sidebar_classes, only: [:index, :show]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @page = BasicPage.find_by(page_title: 'Classes')
  end

  def admin
    load_students
    load_admin_classes
    load_newsletter_subscribers
    load_student_courses
    if !user_signed_in?
      redirect_to root_path
    end

  end

  def show
    session[:class_title] = @class_page.class_title
    session[:sign_up_info] = @class_page.sign_up_info
  end

  def schedule
    @mobile_classes = ClassPage.where(start_time: Time.current.beginning_of_month..Time.current.end_of_month).order("start_time ASC").all
  end

  def edit
  end

  def new
    @class_page = ClassPage.new
  end

  def create
    @class_page = ClassPage.new(class_page_params)
    if @class_page.recurring_event
      save_recurring_classes
    else
      save_multi_event_class
    end
  end

  def save_multi_event_class
    @class_page = ClassPage.new(class_page_params)

    slug_ref = @class_page.class_title.gsub(/[^a-zA-Z0-9 -]/i, '').split(' ').join('-').downcase()
    name = @class_page.class_title

    class_time = [
      @class_page.start_time_1,
      @class_page.start_time_2,
      @class_page.start_time_3,
      @class_page.start_time_4,
      @class_page.start_time_5,
      @class_page.start_time_6,
      @class_page.start_time_7,
      @class_page.start_time_8,
      @class_page.start_time_9,
      @class_page.start_time_10,
      @class_page.start_time_11,
      @class_page.start_time_12,
    ]

    @class_page.class_instances.times do |i|
      if i == 0
        @class_page.update({  class_title: name,
                              class_content: @class_page.class_content,
                              class_photo: @class_page.class_photo,
                              start_time: @class_page.start_time_1,
                              slug_ref: slug_ref,
                              class_instances: @class_page.class_instances,
                              first_instance: true,
                              sign_up_info: @class_page.sign_up_info,
                              include_sign_up: @class_page.include_sign_up,
                              hide_from_sidebar: @class_page.hide_from_sidebar,
                              shopify_button: @class_page.shopify_button})
        @class_page.save
      elsif i > 0

        @multi_instance_class = ClassPage.new({class_title: name, start_time: class_time[i], slug_ref: slug_ref, include_sign_up: @class_page.include_sign_up})
        @multi_instance_class.save
      end
    end

    redirect_to schedule_path
  end

  def save_recurring_classes
    @class_page = ClassPage.new(class_page_params)
    start_date = @class_page.start_time_1
    increment_amount = 7

    year = start_date.year
    month_num = start_date.month
    day_num = start_date.day
    day_of_week = start_date.strftime('%A')
    last_day_of_month = start_date.end_of_month.day
    new_day_num = nil

    #determine the actual day of the first instance and save
    (0..6).each do |i|
      if day_of_week == Date::DAYNAMES[i]
        new_day_num = i + 1
        @class_page.update({start_time: @class_page.start_time_1.change(day: new_day_num)})
        break
      end
    end

    #loop through every unique instance of that day in the year
    (1..51).each do
      new_day_num += increment_amount

      if new_day_num <= last_day_of_month
        @next_class_instance = ClassPage.new(class_page_params)
        @next_class_instance.update({start_time: @next_class_instance.start_time_1.change(month: month_num, day: new_day_num)})

      elsif new_day_num > last_day_of_month
        #determine the new month and day
        next_month_day_offset = last_day_of_month - (new_day_num - increment_amount)
        first_instance_next_month = increment_amount - next_month_day_offset
        month_num += 1

        @next_class_instance = ClassPage.new(class_page_params)
        @next_class_instance.update({start_time: @next_class_instance.start_time_1.change(month: month_num, day: first_instance_next_month)})

        #reset variables for next pass
        new_day_num = first_instance_next_month
        last_day_of_month = @next_class_instance.start_time.end_of_month.day
      end
    end
    redirect_to schedule_path
  end

  def update

    #you would need to update the class title AND slug for every course with = slug

    # if @class_page.first_instance
    #   @classes_to_update = ClassPage.all.where(:slug_ref => @class_page.slug)
    #   @classes_to_update.update_all(:slug => @class_page.class_title)
    # end

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

  def load_student_courses
    @student_courses = ClassPage.all.where({:include_sign_up => true}).where({:first_instance => true}).order("start_time DESC").all
  end

  def set_class_page
    @class_page = ClassPage.friendly.find(params[:id])
  end

  def load_class_pages
    @class_pages = ClassPage.order("start_time ASC").all
  end

  def load_sidebar_classes
    @sidebar_class_pages = ClassPage.where(recurring_event: false).where(hide_from_sidebar: false).order("start_time ASC")
  end

  def load_admin_classes
    @admin_class_pages = ClassPage.order("order_position ASC").all.where(:first_instance => true)

    respond_to do |format|
      format.html
      format.json { render :json => @admin_class_pages }
    end
  end

  def class_page_params
    params.require(:class_page).permit( :start_time,
                                        :start_time_1,
                                        :start_time_2,
                                        :start_time_3,
                                        :start_time_4,
                                        :start_time_5,
                                        :start_time_6,
                                        :start_time_7,
                                        :start_time_8,
                                        :start_time_9,
                                        :start_time_10,
                                        :start_time_11,
                                        :start_time_12,
                                        :class_title,
                                        :recurring_event,
                                        :include_sign_up,
                                        :class_photo,
                                        :class_content,
                                        :slug_ref,
                                        :first_instance,
                                        :class_instances,
                                        :sign_up_info,
                                        :order_position,
                                        :hide_from_sidebar,
                                        :shopify_button)
  end

end
