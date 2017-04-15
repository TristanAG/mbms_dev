class StaticPagesController < ApplicationController
  before_action :load_widgets
  before_action :load_basic_pages

  def home
    @page = BasicPage.find_by(page_title: 'Home')
  end

  def teachers
    @page = BasicPage.find_by(page_title: 'Teachers')
  end

  def contact
    @page = BasicPage.find_by(page_title: 'Contact')
  end

  def thank_you
    @page = BasicPage.find_by(page_title: 'Thank You')
  end

  def mailing_list_thank_you
    @page = BasicPage.find_by(page_title: 'Mailing List Thank You')
  end

  def personal_practice_and_coaching
    @page = BasicPage.find_by(page_title: 'Personal Practice and Coaching')
  end

  def gifts
    @page = BasicPage.find_by(page_title: 'Gifts')
  end

  def resources
    @page = BasicPage.find_by(page_title: 'Resources')
  end

end
