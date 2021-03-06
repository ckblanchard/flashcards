class Organization < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :decks
  has_many :admins

  validates :name, :uniqueness => true

end
