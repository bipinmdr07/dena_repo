ActiveAdmin.register AdminUser do
  # permit_params :email, :password, :password_confirmation

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
    end
    f.actions
  end

end
