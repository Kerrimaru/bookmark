Rails.application.routes.draw do
 

  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  resources :bookmarks
  resources :tags
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'bookmarks#index'
  root to: 'welcome#index'

end
