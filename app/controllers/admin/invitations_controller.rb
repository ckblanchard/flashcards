class Admin::InvitationsController < Devise::InvitationsController
 before_filter :authenticate_admin!

  # GET /admin/invitation/new
  def new
    build_resource
    render :new
  end

  # POST /admin/invitation
  def create
    user = User.new(resource_params)
    user.organization = current_admin.organization
    user.invited_by = current_admin
    user.invite!

    self.resource = user

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

end
