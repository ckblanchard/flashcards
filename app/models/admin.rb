class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:invitable, 

  include DeviseInvitable::Inviter

  after_initialize :initialize_organization

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :first_name, :last_name, :organization_attributes
  

  belongs_to :organization
  accepts_nested_attributes_for :organization
  has_many :invitations, :class_name => 'User', :as => :invited_by

  # # After create takes a symbol for the name of a method it should call when the time comes
  # after_create :add_to_organization

  # # Our method that after_create will call when something has been created
  # def add_to_organization
  #   organization = Organization.create!(name: self.organization_name) 
  #   # Was setting it to the email because organizations have a validation on the name
 
  #   # Assign the newly created organization to this user object
  #   self.organization = organization
 
  #   # Once we assign the association, save it!
  #   self.save
  # end

  private

  def initialize_organization
    if new_record? && !organization
      build_organization
    end
  end

end
