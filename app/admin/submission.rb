ActiveAdmin.register Submission do
  permit_params :name

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
form do |f|
  f.inputs 'Submission' do
    f.input :name
  end
  f.actions
end


end
