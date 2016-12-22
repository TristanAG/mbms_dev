class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def this_week_widget
    @class_pages = ClassPage.order("order_position ASC").all
  end

  def announcement_widget
    @announcements = Announcement.order("id DESC").all
  end

end
