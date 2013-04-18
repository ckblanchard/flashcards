class Admin::InvitationsController < Devise::InvitationsController
 before_filter :authenticate_admin!

  # GET /admin/invitation/new
  def new
    @admin = current_admin
    build_resource
    render :new
  end

  # POST /admin/invitation
  def create
  case
  when :admin
    params[:user][:organization_id] = current_admin.organization_id
  end

    self.resource = resource_class.invite!(resource_params, current_inviter)

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

end


# class InvitationsController < DeviseInvitable::InvitationsController
# def create
# when :user
# params[resource_name][:account_id] = current_account.id
# end
# super
# end
# end