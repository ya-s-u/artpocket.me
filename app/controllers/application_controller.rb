class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Basic Auth on Development
  if ENV['BASIC_AUTH_USERNAME'] && ENV['BASIC_AUTH_PASSWORD']
    http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD']
  end

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

  # Common Sidebar
  before_filter :sidebar_schedule
  def sidebar_schedule
    today = Time.now.at_beginning_of_day
    tommorow   = today + 1.day
    @today = Post.where("open_date <= ? AND ? <= close_date", today, today).order(close_date: :asc)
    @tommorow = Post.where("open_date = ?", tommorow).order(close_date: :asc)
  end
end
