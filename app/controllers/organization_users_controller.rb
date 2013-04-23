class OrganizationUsersController < ApplicationController
  before_filter :authenticate_admin!

  def destroy
  	@user = User.find(params[:id])
    @user.destroy

    redirect_to admin_root_url
  end

end


  # DELETE /organizations/1
#   def destroy
#     @organization = Organization.find(params[:id])
#     @organization.destroy

#     redirect_to organizations_url
#   end