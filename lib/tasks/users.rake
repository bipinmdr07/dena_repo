namespace :users do
  task :convert_to_immersive => :environment do
    User.update_all(package: :immersive)
  end

  task :update_progressions => :environment do

    
  end
end