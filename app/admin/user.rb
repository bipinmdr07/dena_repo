ActiveAdmin.register User do
  permit_params :email, :intro_access, :html_css_access, :ruby_fundamentals_access, :ideator_access, :ruby_core_access, :instapost_access, :github_access, :javascript_access, :admin

  index do
    column :name
    column :email
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :admin
    column :intro_access
    column :html_css_access
    column :ruby_fundamentals_access
    column :ideator_access
    column :ruby_core_access
    column :instapost_access
    column :github_access
    column :javascript_access
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :name
      f.input :email
      f.input :admin
      f.input :intro_access
      f.input :html_css_access
      f.input :ruby_fundamentals_access
      f.input :ideator_access
      f.input :ruby_core_access
      f.input :instapost_access
      f.input :github_access
      f.input :javascript_access
    end
    f.actions
  end

end
