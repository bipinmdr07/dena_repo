desc "Send Pre-work Reminder Emails"

task :send_reminders => :environment do
  puts "Sending pre-work reminders..."
  User.active_prework_students.each do |user|
    user.send_prework_reminder
  end
  puts "done."
end