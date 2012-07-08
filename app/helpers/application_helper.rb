module ApplicationHelper
  def manifest
    Rails.env.production? ? 'manifest="/manifest.appcache"'.html_safe : ''
  end
end