class ApplicationController < ActionController::Base
  before_action :basic_auth

  def authenticate_any!
    if cliant_signed_in?
      true
    else
      authenticate_trainer!
    end
  end

  def after_sign_in_path_for(resource)
    posts_path(resource)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
