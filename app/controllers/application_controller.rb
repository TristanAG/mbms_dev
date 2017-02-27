class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def this_week_widget
    today = Date.today
    seven_days_later = today + 7
    @classes = ClassPage.where(start_time: today..seven_days_later).order("start_time ASC").all
  end

  def announcement_widget
    @announcements = Announcement.order("id DESC").all
  end

  def load_students
    @students = Student.all.where.not(:class_name => nil).order("created_at DESC").all
  end

  def load_newsletter_subscribers
    @newsletter_subscribers = Student.all.where(:email_list => "Yes, please!").order("created_at DESC").all
  end

  def load_widgets
    this_week_widget
    announcement_widget
  end

end
