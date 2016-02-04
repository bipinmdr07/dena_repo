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

  get 'intro_lessons', :to => 'intro_lessons#index', :as => 'intro'
  get 'intro_lessons/:id', :to => 'intro_lessons#show', :as => 'intro_lessons'

  get 'html_css_lessons', :to => 'html_css_lessons#index', :as => 'html_css'
  get 'html_css_lessons/:id', :to => 'html_css_lessons#show', :as => 'html_css_lessons'

  get 'ideator_lessons', :to => 'ideator_lessons#index', :as => 'ideator'
  get 'ideator_lessons/:id', :to => 'ideator_lessons#show', :as => 'ideator_lessons'

  get 'ruby_lessons', :to => 'ruby_lessons#index', :as => 'ruby'
  get 'ruby_lessons/:id', :to => 'ruby_lessons#show', :as => 'ruby_lessons' 

  get 'courses',   :to => 'static_pages#courses'

  get 'pricing', :to => 'static_pages#pricing'

  get 'congratulations', :to => 'static_pages#congratulations'
end
