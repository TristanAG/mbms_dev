Rails.application.routes.draw do
  resources :students
  devise_for :users
  get '/login', to: redirect('/users/sign_in')
  resources :announcements
  #resources :class_pages

  resources :class_pages, :path => 'classes' do
    resources :show
  end

  get '/admin', to: 'class_pages#admin'

  get '/thank-you', to: 'static_pages#thank_you'

  root 'static_pages#home'
  get '/teachers', to: 'static_pages#teachers'
  get '/schedule', to: 'class_pages#schedule'
  get '/classes', to: 'class_pages#index'
  #get '/class_pages/show', to: 'class_pages#show', :as => :show
  get '/contact', to: 'static_pages#contact'
  get '/gifts', to:'static_pages#gifts'
  get '/personal-practice-and-coaching', to: 'static_pages#personal_practice_and_coaching'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/newsletter', to: 'students#email_list_sign_up_page'
  get '/newsletter-thank-you', to: 'static_pages#mailing_list_thank_you'

  # #temporary class redirects during site switch-over
  # get '/classes/community-event-beach-bonfire', to: redirect('/classes/bonfire.php')
  # get '/classes/the-mindful-and-compassionate-living-series', to: redirect('/classes/the-mindful-and-compassionate-living-series.php')
  # get '/classes/stillness-practice-a-silent-retreat-at-asilomar', to: redirect('/classes/stillness-practice.php')
  # get '/classes/stillness-practice.php'
  # #google seo redirects
  # get '/index.php', to: redirect('/')
  # get '/teachers/php', to: redirect('/teachers')
  # get '/schedule.php', to: redirect('/schedule')
  # get '/classes/index.php', to: redirect('/classes')
  # get '/contact.php', to: redirect('/contact')

end
