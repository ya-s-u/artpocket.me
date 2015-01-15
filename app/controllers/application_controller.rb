class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Jpmobile::ViewSelector
  before_filter :disable_mobile_view_if_tablet

  def disable_mobile_view_if_tablet
    if request.mobile && request.mobile.tablet?
      disable_mobile_view!
    end
  end
end
