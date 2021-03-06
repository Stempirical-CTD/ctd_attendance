class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  include SortHelper

  def alert_errors(resource)
    flash.alert = resource.errors.to_a.join '. '
  end

  private def user_not_authorized
    flash.alert = 'Access denied'
    redirect_to request.referrer || root_path
  end
end
