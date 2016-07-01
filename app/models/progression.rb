class Progression < ActiveRecord::Base
  belongs_to :user
  include PublicActivity::Model

  validates_uniqueness_of :lesson_id, scope: :course_name

  after_destroy :delete_tag_activity

  def delete_tag_activity
    activity = PublicActivity::Activity.where('trackable_type = ? AND trackable_id = ?',  
                                            'Progression',self.id).first
    activity.destroy if activity
  end
  
end
