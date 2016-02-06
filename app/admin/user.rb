ActiveAdmin.register User do

  index do
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
    actions
  end

end
