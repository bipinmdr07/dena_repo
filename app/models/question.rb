require 'elasticsearch/model'

class Question < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_votable

  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :users, through: :replies

  validates :title, :content, :user_id, presence: true
  validates :lesson_id, :course_name, presence: true, unless: :is_mentor_post?

  delegate :name, :email, :avatar, :admitted, :mentor, to: :user, prefix: true
  delegate :url_helpers, to: 'Rails.application.routes' 

  default_scope { order("created_at DESC") }
  scope :unresolved, -> { where(resolved: false) }
  scope :student_post, -> { where(mentor_post: false) } 

  before_create :set_mentor_post
  after_create :send_notifications 

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

  def set_mentor_post
    return unless user.mentor
    self.mentor_post = true
  end

  def send_email_notification
    UserMailer.new_question(self).deliver_later
  end

  def send_slack_notification
    post_type = mentor_post ? "mentor post" : "question"

    Slack.chat_postMessage(text: "New #{post_type}: < #{url_helpers.question_url(id)} | #{title} > by #{user_name}", 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def send_notifications
    send_email_notification
    send_slack_notification
  end

  def is_mentor_post?
    mentor_post 
  end
end
