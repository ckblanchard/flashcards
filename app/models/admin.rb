class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :organization_id, :organization_name
  # attr_accessible :title, :body

  belongs_to :organization

  # After create takes a symbol for the name of a method it should call when the time comes
  after_create :add_to_organization

  # Our method that after_create will call when something has been created
  def add_to_organization
    organization = Organization.create(name: self.organization_name) 
    # Was setting it to the email because organizations have a validation on the name
 
    # Assign the newly created organization to this user object
    self.organization = organization
 
    # Once we assign the association, save it!
    self.save
  end

end
