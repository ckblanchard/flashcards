class Deck < ActiveRecord::Base
  attr_accessible :name, :organization_id, :topic_id, :description

  belongs_to :organization
  has_many :cards
end
