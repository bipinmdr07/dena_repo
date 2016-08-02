require 'elasticsearch/model'

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, :user_id, presence: true
  validates :lesson_id, :course_name, presence: true, unless: :is_mentor_post?

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(*args)
    __elasticsearch__.search(*args)
  end

  def as_indexed_json(options={})
    self.as_json(
      include: { replies: { only: :id }
    })
  end

  private

  def is_mentor_post?
    return true if mentor_post
    false
  end
end
