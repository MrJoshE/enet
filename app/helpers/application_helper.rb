module ApplicationHelper
  def on_home_page
    return false if (params[:controller] == 'pages' && params[:action] == 'index') || (params[:controller] == 'registrations' && params[:action] == 'index') || (params[:controller] == 'pages' && params[:action] == 'about')
    true
  end
end
