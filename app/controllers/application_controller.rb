class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to_mobile_requests skip_xhr_requests: false
end
