class Progression < ApplicationRecord
  include PublicActivity::Model

  belongs_to :user

  after_destroy :delete_tag_activity

  validates :course_name, uniqueness: { scope: [:lesson_id, :user_id] }

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  private

  def delete_tag_activity
    activity = PublicActivity::Activity.where('trackable_type = ? AND trackable_id = ?',  
                                            'Progression',self.id).first
    activity.destroy if activity
  end
  
end
