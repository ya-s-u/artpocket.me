class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Tablet uses PC view
  include Jpmobile::ViewSelector
  before_filter :disable_mobile_view_if_tablet

  def disable_mobile_view_if_tablet
    if request.mobile && request.mobile.tablet?
      disable_mobile_view!
    end
  end

  # Exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404(exception = nil)
    render template: "errors/404", status: 404, layout: 'application'
  end

  def render_500(exception = nil)
    render template: "errors/500", status: 500, layout: 'application'
  end
end
