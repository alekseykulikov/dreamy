class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to_mobile_requests

  layout :set_layout

  private

  def set_layout
    case params[:layout]
      when 'jquerymobile' then 'application.mobile.erb'
      when 'kendoui' then 'kendoui.mobile.erb'
      else 'application.html.erb'
    end
  end
end
