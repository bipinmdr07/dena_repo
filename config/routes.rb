Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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

  resources :submissions do
    resources :submission_comments do
      post :submission_replies, :to => 'submission_replies#create',  as: 'replies'
    end
  end

  get 'admin_dashboard', :to => 'admin_dashboard#index'

  get 'intro', :to => 'intro#index', :as => 'intro'
  get 'intro/:id', :to => 'intro#show', :as => 'intro_lesson'

  get 'html_css', :to => 'html_css#index', :as => 'html_css'
  get 'html_css/:id', :to => 'html_css#show', :as => 'html_css_lesson'

  get 'ideator_lessons', :to => 'ideator_lessons#index', :as => 'ideator'
  get 'ideator_lessons/:id', :to => 'ideator_lessons#show', :as => 'ideator_lessons'

  get 'courses',   :to => 'static_pages#courses'

  get 'pricing', :to => 'static_pages#pricing'

  get 'congratulations', :to => 'static_pages#congratulations'
end
