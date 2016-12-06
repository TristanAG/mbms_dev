class StaticPagesController < ApplicationController
  before_action :load_widgets

  def home
  end

  def teachers
  end

  def classes
  end

  def contact
  end

  private

  def load_widgets
    this_week_widget
  end
end
