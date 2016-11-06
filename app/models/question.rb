require 'elasticsearch/model'

class Question < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Notifiable

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_votable

  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :users, through: :replies

  validates :title, :content, :user_id, presence: true
  validates :lesson_id, :course_name, presence: true, unless: :is_mentor_post?

  delegate :name, :email, :avatar, :admitted, :mentor, to: :user, prefix: true

  default_scope { order("created_at DESC") }
  scope :unresolved, -> { where(resolved: false) }
  scope :student_post, -> { where(mentor_post: false) } 

  before_create :set_mentor_post

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

  def notifiable
    self
  end

  def set_mentor_post
    return unless user.mentor
    self.mentor_post = true
  end

  def is_mentor_post?
    mentor_post 
  end
end
