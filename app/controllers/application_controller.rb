class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate_admin_user! #use predefined method name
    redirect_to 'home#index' and return if user_signed_in? && !current_user.is_admin?
    authenticate_user!
  end

  def current_admin_user #use predefined method name
    return nil if user_signed_in? && !current_user.is_admin?
    current_user
  end


  def after_sign_up_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_admin?
          admin_dashboard_path
        else
          user_path(resource)
        end
  end


  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_admin?
          admin_orders_path
        else
          user_path(resource)
        end
  end

  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'

end
