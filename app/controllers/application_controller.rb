class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def this_week_widget
    #@classes = ClassPage.where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).order("start_time ASC").all

    today = Date.today
    seven_days_later = today + 7
    @classes = ClassPage.where(start_time: today..seven_days_later).order("start_time ASC").all
    # today = Date.today
    # seven_days_later = Time.new(Date.today.strftime('%Y'), Date.today.strftime('%m'), Date.today.strftime('%d').to_i + 7)
    # @classes = ClassPage.where(start_time: today..seven_days_later).order("start_time ASC").all
  end

  def announcement_widget
    @announcements = Announcement.order("id DESC").all
  end

  def load_students
    @students = Student.order("id DESC").all
  end

  def load_newsletter_subscribers
    @newsletter_subscribers = Student.all.where(:email_list => "Yes, please!")
  end

  def load_widgets
    this_week_widget
    announcement_widget
  end


end
