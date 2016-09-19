class ChangeDefaultRemainingMentorSessions < ActiveRecord::Migration
  def change
    change_column :users, :remaining_mentor_sessions, :integer, default: 16
  end
end
