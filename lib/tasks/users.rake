namespace :users do
  task :update_name => :environment do 
    User.all.each do |user|
      next if user.first_name && user.last_name
      first_name = user.name.split(" ")[0]
      if user.name.split(" ").length > 1
        last_name = user.name.split(" ").last
      else
        last_name = "Last Name"
      end
      user.update(first_name: first_name, last_name: last_name)
    end
  end

  task :update_prework_status => :environment do
    User.where.not(start_date: nil).each do |user|
      user.admitted = true
      user.save
    end
    User.where(start_date: nil).each do |user|
      user.prework_start_time = Date.today - 1.weeks
      user.prework_end_date = Date.today + 1.weeks
      user.save
    end
    User.where(admin: true).each do |user|
      user.prework_start_time = nil
      user.prework_end_date = nil
      user.save
    end
  end
end