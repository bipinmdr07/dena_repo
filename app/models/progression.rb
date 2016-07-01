class Progression < ActiveRecord::Base
  include PublicActivity::Model
  include RankedModel

  belongs_to :user

  validates_uniqueness_of :lesson_id, scope: :course_name

  after_destroy :delete_tag_activity

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  ranks :user_id, scope: :today

  def delete_tag_activity
    activity = PublicActivity::Activity.where('trackable_type = ? AND trackable_id = ?',  
                                            'Progression',self.id).first
    activity.destroy if activity
  end
  
end
