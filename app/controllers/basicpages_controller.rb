class BasicpagesController < ApplicationController
  def welcome
  	@user = User.new
  	@admin = Admin.new
  end

  def about
  end
end
