ActiveAdmin.register Forum do
  permit_params :name

  form do |f|
    f.inputs 'Forum' do
      f.input :name
    end
    f.actions
  end


end
