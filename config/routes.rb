Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations" }, path_names: {
    sign_up: ''
  }

  mount ActionCable.server => '/cable'

  # devise_for :immersive_students, class_name: 'User', controllers: {registrations: "immersive_applicants", :sessions => 'main' } do
  #   get   "apply/remote" => "apply#remote", as: 'apply_remote'
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  get 'apply', to: 'apply#index', as: 'apply'
  get 'apply/remote', to: 'apply#remote', as: 'apply_remote'
  get 'apply/immersive', to: 'apply#immersive', as: 'apply_immersive'

  get 'remote', to: 'static_pages#remote'
  get 'immersive', to: 'static_pages#immersive'

  get 'apply/remote/next-steps', to: 'apply#remote_next_steps'
  get 'apply/immersive/next-steps', to: 'apply#immersive_next_steps'

  resources :applicants, only: :index

  resources :users, only: [] do
    resources :student_admissions, only: :create
  end
  
  resources 'contacts', only: [:new, :create]

  resources :questions do
    resources :replies, only: [:create, :edit, :update]
  end

  resources :replies, only: [:destroy]

  resources :community, only: :index

  resources :submissions do
    resources :submission_replies, only: [:create, :edit, :update]
  end

  resources :submission_replies, only: [:destroy]

  resources :mentees, only: :index do
    resources :mentor_sessions, except: :destroy
  end

  resources :student_sessions, except: :destroy

  resources :decks do
    resources :cards
  end

  resources :cards do
    patch :archive
  end

  resources :markdown_previews, only: :create

  resources :posts, only: [:index, :show]
  resources :events, only: [:index, :show]

  get 'blog', to: 'blog#index', as: 'blog'

  resources :progressions, only: [:create, :destroy]

  resources :prework_kickoffs, only: :create

  resources :images, only: [:create, :destroy]

  resources :admin_dashboard, only: :index

  resources :notifications  do
    collection do
      post :mark_as_read
    end
  end	  

  namespace :admin do
    resources :decks
    resources :cards
  end

  post 'question_upvotes/:id(.:format)', to: 'question_upvotes#create', as: 'question_upvote'

  post 'question_downvotes/:id(.:format)', to: 'question_downvotes#create', as: 'question_downvote'

  patch 'update_interval/:id(.:format)', to: 'cards#update_interval', as: 'update_interval'

  post 'submission_approvals/:id(.:format)', to: 'submission_approvals#create', as: 'submission_approvals'

  patch 'comment_statuses/:id(.:format)', to: 'comment_statuses#create', as: 'comment_statuses'

  patch 'question_statuses/:id(.:format)', to: 'question_statuses#create', as: 'question_statuses'

  get 'study', to: 'study#index', as: 'study'

  get 'intro_lessons', to: 'intro_lessons#index', as: 'intro'
  get 'intro_lessons/:id', to: 'intro_lessons#show', as: 'intro_lessons'

  get 'html_css_lessons', to: 'html_css_lessons#index', as: 'html_css'
  get 'html_css_lessons/:id', to: 'html_css_lessons#show', as: 'html_css_lessons'

  get 'bootstrap_lessons', to: 'bootstrap__lessons#index', as: 'bootstrap'
  get 'bootstrap_lessons/:id', to: 'bootstrap__lessons#show', as: 'bootstrap_lessons'

  get 'ideator_lessons', to: 'ideator_lessons#index', as: 'ideator'
  get 'ideator_lessons/:id', to: 'ideator_lessons#show', as: 'ideator_lessons'

  get 'ruby_lessons', to: 'ruby_lessons#index', as: 'ruby'
  get 'ruby_lessons/:id', to: 'ruby_lessons#show', as: 'ruby_lessons'

  get 'ruby_core_lessons', to: 'ruby_core_lessons#index', as: 'ruby_core'
  get 'ruby_core_lessons/:id', to: 'ruby_core_lessons#show', as: 'ruby_core_lessons'

  get 'instapost_lessons', to: 'instapost_lessons#index', as: 'instapost'
  get 'instapost_lessons/:id', to: 'instapost_lessons#show', as: 'instapost_lessons'

  get 'github_lessons', to: 'github_lessons#index', as: 'github'
  get 'github_lessons/:id', to: 'github_lessons#show', as: 'github_lessons'

  get 'javascript_lessons', to: 'javascript_lessons#index', as: 'javascript'
  get 'javascript_lessons/:id', to: 'javascript_lessons#show', as: 'javascript_lessons'

  get 'rspec_blog_lessons', to: 'rspec_blog_lessons#index', as: 'rspec_blog'
  get 'rspec_blog_lessons/:id', to: 'rspec_blog_lessons#show', as: 'rspec_blog_lessons'

  get 'algorithm_lessons', to: 'algorithm_lessons#index', as: 'algorithm'
  get 'algorithm_lessons/:id', to: 'algorithm_lessons#show', as: 'algorithm_lessons'

  get 'command_line_lessons', to: 'command_line_lessons#index', as: 'command_line'
  get 'command_line_lessons/:id', to: 'command_line_lessons#show', as: 'command_line_lessons'

  get 'mvc_lessons', to: 'mvc_lessons#index', as: 'mvc'
  get 'mvc_lessons/:id', to: 'mvc_lessons#show', as: 'mvc_lessons'

  get 'skill_academy_lessons', to: 'skill_academy_lessons#index', as: 'skill_academy'
  get 'skill_academy_lessons/:id', to: 'skill_academy_lessons#show', as: 'skill_academy_lessons'

  get 'collaboration_lessons', to: 'collaboration_lessons#index', as: 'collaboration'
  get 'collaboration_lessons/:id', to: 'collaboration_lessons#show', as: 'collaboration_lessons'

  get 'mentor_guidelines', to: 'mentor_materials#guidelines'
  get 'mentor_resources', to: 'mentor_materials#resources'

  get 'dashboard',   to: 'dashboard#index'
  get 'courses',   to: 'courses#index'
  get 'guidelines',   to: 'static_pages#guidelines'

  get 'curriculum', to: 'static_pages#curriculum'
  # get 'pricing', to: 'static_pages#pricing'
  # get 'congratulations', to: 'static_pages#congratulations'
  get 'about', to: 'static_pages#about'
  get 'contact_us', to: 'static_pages#contact_us'
  # get 'learn', to: 'static_pages#learn'
  # get 'preregistration', to: 'static_pages#preregistration'
  get 'support', to: 'static_pages#support'

  #error routes
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'errors/not_found'
  get 'errors/internal_server_error'

end
