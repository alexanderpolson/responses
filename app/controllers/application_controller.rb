class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :log_request

  def render_404

  end

  private
  def log_request
    Rails.logger.info("Request Parameters: #{request.inspect}")
  end
end
