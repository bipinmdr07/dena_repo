ActiveAdmin.register Post do
  permit_params :user_id, :title, :body, :featured_image

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      scoped_collection.find(params[:id])
    end
  end

  form do |f|
    f.inputs 'Blog Post' do
      f.input :title
      f.input :featured_image
      f.input :body, input_html: { 'data-provider'=> "summernote"}
      f.input :user_id, as: :hidden, input_html: {value: current_admin_user.id}
    end
    f.actions
  end


end
