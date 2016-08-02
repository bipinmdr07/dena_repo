namespace :users do
  task :update_name => :environment do 
    User.all.each do |user|
      first_name = user.name.split(" ")[0]
      if user.name.split(" ").length > 1
        last_name = user.name.split(" ").last
      else
        last_name = " "
      end
      user.update(first_name: first_name, last_name: last_name)
    end
  end
end