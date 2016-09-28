require 'elasticsearch/model'

class Question < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :users, through: :replies

  validates :title, :content, :user_id, presence: true
  validates :lesson_id, :course_name, presence: true, unless: :is_mentor_post?

  delegate :name, :email, :avatar, to: :user, prefix: true

  scope :unresolved, -> { where(resolved: false) }
  scope :student_post, -> { where(mentor_post: false) }

  acts_as_votable

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks  

  def should_generate_new_friendly_id?
    title_changed? || super
  end

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
