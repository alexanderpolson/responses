class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :log_request

  def render_404

  end

  private
  def log_request
    env_values = {}
    ['HTTP_USER_AGENT', 'REMOTE_ADDR', 'HTTP_X_FORWARDED_FOR'].each do |key|
      env_values[key] = request.env[key]
    end
    Rails.logger.info("Request ENV: #{env_values}")
  end
end
