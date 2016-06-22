class Progression < ActiveRecord::Base
  belongs_to :user

  include PublicActivity::Model
  
end
