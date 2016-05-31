namespace :users do
  task :update_name => :environment do 
    User.all.each do |user|
      first_name = user.name.split(" ")[0]
      last_name = user.name.split(" ")[1]
      user.update(first_name: first_name, last_name: last_name)
    end
  end
end