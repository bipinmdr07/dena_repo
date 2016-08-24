ActiveAdmin.register Event do
  permit_params :title, :overview, :facebook_link, :datetime, :venue, :featured_image, :signup_link

  form do |f|
    f.inputs 'Event' do
      f.input :title
      f.input :overview, input_html: { 'data-provider'=> "summernote"}
      f.input :datetime    
      f.input :venue
      f.input :facebook_link
      f.input :signup_link
      f.input :featured_image
    end
    f.actions
  end


end
