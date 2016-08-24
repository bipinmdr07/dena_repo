desc "Send Pre-work Reminder Emails"

task :send_prework_reminders => :environment do
  puts "Sending pre-work reminders..."
  User.active_prework_students.each do |user|
    puts "Sending reminder to #{user.name}..."
    user.send_prework_reminder
    puts "Sent reminder to #{user.name}"
  end
  puts "done."
end