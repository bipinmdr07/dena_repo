Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  resources 'contacts', only: [:new, :create]

  resources :forums do
  	resources :comments do
      post :replies, :to => 'replies#create'
    end
  end

  get 'intro', :to => 'intro#index', :as => 'intro'
  get 'intro/:id', :to => 'intro#show', :as => 'intro_lesson'
  get 'courses',   :to => 'static_pages#courses'
end
