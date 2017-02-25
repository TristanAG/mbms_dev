class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def this_week_widget
    @classes = ClassPage.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
    # today = Date.today
    # seven_days_later = Time.new(today.strftime('%Y'), today.strftime('%m'), today.strftime('%d').to_i + 7)
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
