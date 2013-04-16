class Admin::OrganizationsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    #@organizations = Organization.all
    @organization = current_admin.organization
  end

  # GET /organizations/1
  def show
    @organization = current_admin.organization
  end

  # GET /organizations/new
  def new
    #@organization = current_admin.admin.organization.new ???
    @organization = Organization.new
  end

  def edit
    #@organization = Organization.find(params[:id])
    @organization = current_admin.organization
  end

  # POST /organizations
  def create
    #@organization = current_admin.admin.organizations.create(params[:admin]) ???
    @organization = Organization.new(params[:organization])

    if @organization.save
      redirect_to admin_organizations_path, notice: 'Organization was successfully created.'
    else
      render :new, notice: "Please use a different name."
    end
  end


  # PUT /organizations/1
  def update
    @organization = Organization.find(params[:id])
    #@organization = current_admin.organization

    #attempt to re-assign admin's :organization_name if user renames organization's :name
    # @admin = current_admin
    # @admin.organization_name = @organization.name

    if @organization.update_attributes(params[:organization])
      redirect_to admin_organizations_url, notice: 'Organization was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /organizations/1
  # def destroy
  #   @organization = Organization.find(params[:id])
  #   @organization.destroy

  #   redirect_to admin_organizations_url
  # end

end