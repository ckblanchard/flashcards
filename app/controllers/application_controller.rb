class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end
end
