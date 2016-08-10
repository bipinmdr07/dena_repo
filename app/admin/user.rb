ActiveAdmin.register User do
  permit_params :email, :intro_access, :html_css_access, :ruby_fundamentals_access, :ideator_access,
  :ruby_core_access, :instapost_access, :github_access, :javascript_access, :admin, :command_line_access,
  :rspec_blog_access, :mvc_access, :mentor, :start_date, :graduation_date, :remaining_mentor_sessions, :mentor_id,
  :facebook_handle, :twitter_handle, :github_handle, :personal_website, :prework_start_time, :prework_end_date, :admitted 

  index do
    column :name
    column :first_name
    column :last_name
    column :email
    column :created_at
    column :sign_in_count
    column :start_date
    column :graduation_date
    column :prework_start_time
    column :prework_end_date
    column :current_sign_in_at
    column :last_sign_in_at
    column :admitted
    column :intro_access
    column :html_css_access
    column :ruby_fundamentals_access
    column :ideator_access
    column :ruby_core_access
    column :instapost_access
    column :github_access
    column :javascript_access
    column :command_line_access
    column :rspec_blog_access
    column :mvc_access
    column :remaining_mentor_sessions
    column :mentor_id
    column :facebook_handle
    column :twitter_handle
    column :github_handle
    column :personal_website
    column :mentor
    column :admin
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :admitted
      f.input :admin
      f.input :mentor
      f.input :intro_access
      f.input :html_css_access
      f.input :ruby_fundamentals_access
      f.input :ideator_access
      f.input :ruby_core_access
      f.input :instapost_access
      f.input :github_access
      f.input :javascript_access
      f.input :command_line_access
      f.input :rspec_blog_access
      f.input :mvc_access
      f.input :start_date, :as => :datepicker
      f.input :graduation_date, :as => :datepicker
      f.input :remaining_mentor_sessions
      f.input :mentor_id, as: :select, collection: User.where(mentor: true).map{|u| ["#{u.name}", u.id]}
      f.input :facebook_handle
      f.input :twitter_handle
      f.input :github_handle
      f.input :personal_website
    end
    f.actions
  end

  actions :all, except: [:destroy]

end
