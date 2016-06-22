ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    column :email
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
  end

  actions :all, except: [:destroy]
end
