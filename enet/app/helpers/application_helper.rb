module ApplicationHelper
  def on_home_page
    return false if params[:controller] == 'pages' && params[:action] == 'index'
    true
  end
end
