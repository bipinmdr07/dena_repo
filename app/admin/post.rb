ActiveAdmin.register Post do
  permit_params :user_id, :title, :body, :featured_image

  form do |f|
    f.inputs 'Blog Post' do
      f.input :title
      f.input :featured_image
      f.input :body, :as => :ckeditor
      f.input :user_id, as: :hidden, input_html: {value: current_admin_user.id}
    end
    f.actions
  end


end
