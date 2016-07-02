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

  resources :cards

  resources :posts
  get 'blog', to: 'blog#index', as: 'blog'

  resources :progressions, only: [:create, :destroy]

  
  put 'update_interval/:id(.:format)', to: 'cards#update_interval', as: 'update_interval'

  get 'study', to: 'study#index', as: 'study'

  # get 'admin_dashboard', :to => 'admin_dashboard#index', :as => 'dashboard'

  get 'intro_lessons', :to => 'intro_lessons#index', :as => 'intro'
  get 'intro_lessons/:id', :to => 'intro_lessons#show', :as => 'intro_lessons'

  get 'html_css_lessons', :to => 'html_css_lessons#index', :as => 'html_css'
  get 'html_css_lessons/:id', :to => 'html_css_lessons#show', :as => 'html_css_lessons'

  get 'ideator_lessons', :to => 'ideator_lessons#index', :as => 'ideator'
  get 'ideator_lessons/:id', :to => 'ideator_lessons#show', :as => 'ideator_lessons'

  get 'ruby_lessons', :to => 'ruby_lessons#index', :as => 'ruby'
  get 'ruby_lessons/:id', :to => 'ruby_lessons#show', :as => 'ruby_lessons'

  get 'ruby_core_lessons', :to => 'ruby_core_lessons#index', :as => 'ruby_core'
  get 'ruby_core_lessons/:id', :to => 'ruby_core_lessons#show', :as => 'ruby_core_lessons' 

  get 'instapost_lessons', :to => 'instapost_lessons#index', :as => 'instapost'
  get 'instapost_lessons/:id', :to => 'instapost_lessons#show', :as => 'instapost_lessons'

  get 'github_lessons', :to => 'github_lessons#index', :as => 'github'
  get 'github_lessons/:id', :to => 'github_lessons#show', :as => 'github_lessons'

  get 'javascript_lessons', :to => 'javascript_lessons#index', :as => 'javascript'
  get 'javascript_lessons/:id', :to => 'javascript_lessons#show', :as => 'javascript_lessons'

  get 'algorithm_lessons', :to => 'algorithm_lessons#index', :as => 'algorithm'
  get 'algorithm_lessons/:id', :to => 'algorithm_lessons#show', :as => 'algorithm_lessons'

  get 'mvc_lessons', :to => 'mvc_lessons#index', :as => 'mvc'
  get 'mvc_lessons/:id', :to => 'mvc_lessons#show', :as => 'mvc_lessons'

  get 'dashboard',   :to => 'static_pages#dashboard'
  get 'courses',   :to => 'static_pages#courses'
  get 'activity_log',   :to => 'static_pages#activity_log'

  get 'pricing', :to => 'static_pages#pricing'
  get 'congratulations', :to => 'static_pages#congratulations'
  get 'about', to: 'static_pages#about'
  get 'contact_us', to: 'static_pages#contact_us'
  get 'learn', to: 'static_pages#learn'
  get 'preregistration', to: 'static_pages#preregistration'
  get 'support', to: 'static_pages#support'
  
end
