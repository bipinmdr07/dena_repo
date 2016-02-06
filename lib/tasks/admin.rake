task :create_admins => :environment do 
  AdminUser.create(email: 'takehiromouri@gmail.com', password: 'tak22thegoat', password_confirmation: 'tak22thegoat') unless AdminUser.where(email: 'takehiromouri@gmail.com').exists?
  AdminUser.create(email: 'naztshinozaki@gmail.com', password: 'oreos', password_confirmation: 'oreos') unless AdminUser.where(email: 'naztshinozaki@gmail.com').exists?
end