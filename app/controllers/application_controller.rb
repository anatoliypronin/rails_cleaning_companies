class ApplicationController < ActionController::Base
  include AuthHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  def forbidden
    redirect_to admin_root_path
  end

  def current_user
    current_admin
  end
end
