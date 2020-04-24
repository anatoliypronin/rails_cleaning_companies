module AuthHelper
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_sign_out
    session.delete(:admin_id)
  end

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_sign_in?
    current_admin
  end

  def authenticate_admin!
    redirect_to new_session_path unless admin_sign_in?
  end
end
