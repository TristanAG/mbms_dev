class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_controller?(names)
    names.include?(current_controller)
  end

  def this_week_widget
    @class_pages = ClassPage.order("order_position ASC").all
    #how do i only pull the relevant dates?

    #today = Date.today # Today's date
    #@current_week = (today.at_beginning_of_week..today.at_end_of_week).map

    #cycle through the first day and look for all events with that date
    #repeat for each day of the week
  end

  def announcement_widget
    @announcements = Announcement.order("id DESC").all
  end

  def load_widgets
    this_week_widget
    announcement_widget
  end

end
