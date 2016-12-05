Rails.application.routes.draw do
  #resources :class_pages

  resources :class_pages, :path => 'classes' do
    resources :show
  end

  root 'static_pages#home'
  get '/teachers', to: 'static_pages#teachers'
  get '/schedule', to: 'static_pages#schedule'
  get '/classes', to: 'class_pages#index'
  #get '/class_pages/show', to: 'class_pages#show', :as => :show
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
