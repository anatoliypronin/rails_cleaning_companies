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
    redirect_to new_admin_session_path unless admin_sign_in?
  end

  def company_sign_in(company)
    session[:company_id] = company.id
  end

  def company_sign_out
    session.delete(:company_id)
  end

  def current_company
    Company.find_by(id: session[:company_id])
  end

  def company_sign_in?
    current_company
  end

  def authenticate_company!
    redirect_to new_company_session_path unless company_sign_in?
  end

  def client_sign_in(client)
    session[:client_id] = client.id
  end

  def client_sign_out
    session.delete(:client_id)
  end

  def current_client
    Client.find_by(id: session[:client_id])
  end

  def client_sign_in?
    current_client
  end

  def authenticate_client!
    redirect_to new_client_session_path unless client_sign_in?
  end
end
