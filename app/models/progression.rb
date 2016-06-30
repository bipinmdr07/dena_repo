class Progression < ActiveRecord::Base
  belongs_to :user
  include PublicActivity::Model

  validates_uniqueness_of :lesson_id, scope: :course_name
  
end
