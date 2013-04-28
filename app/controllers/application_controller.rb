class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      "/decks"
    else
      super
    end
  end

  protected
  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end
end