Rails.application.routes.draw do
 

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :bookmarks
  resources :tags
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bookmarks#index'

   # token auth routes available at /api/v1/auth
   namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

end
