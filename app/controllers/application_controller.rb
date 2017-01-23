class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def this_week_widget
    @classes = ClassPage.where(start_time: Time.current.beginning_of_week..Time.current.end_of_week)
  end

  def announcement_widget
    @announcements = Announcement.order("id DESC").all
  end

  def load_students
    @students = Student.all
  end

  def load_widgets
    this_week_widget
    announcement_widget
  end

end
