# desc "Send Pre-work Reminder Emails"

# task :send_prework_reminders => :environment do
#   puts "Sending pre-work reminders..."
#   User.active_prework_students.each do |user|
#     puts "Sending reminder to #{user.name}..."
#     user.send_prework_reminder
#     puts "Sent reminder to #{user.name}"
#   end
#   puts "done."
# end

# task :send_prework_finished_messages => :environment do
#   puts "Sending emails..." 
#   User.declined_today.each do |user|
#     puts "Sending email to #{user.name}"
#     user.send_prework_finished_message
#     puts "Sent email to #{user.name}"
#   end
#   puts "done."
# end