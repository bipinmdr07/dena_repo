require 'elasticsearch/model'

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, :user_id, :lesson_id, :course_name, presence: true

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(*args)
    __elasticsearch__.search(*args)
  end

  def as_indexed_json(options={})
    self.as_json(
      include: { replies: { only: :id}
    })
  end
  
  # def self.search(params)
  #   tire.search(load: true) do
  #     query { string params[:query], default_operator: "AND" } if params[:query].present?
  #     filter :range, published_at: {lte: Time.zone.now}
  #   end
  # end
end
