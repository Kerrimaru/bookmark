Rails.application.routes.draw do
 

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :bookmarks
  resources :tags
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bookmarks#index'

end
