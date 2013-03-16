class ApplicationController < ActionController::Base
  protect_from_forgery


  def not_authenticated
    redirect_to(root_url, alert: :login_alert)
  end
  

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
