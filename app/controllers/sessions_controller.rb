class SessionsController < ApplicationController
  def new; end

  def create
    admin = Admin.find_by(email: params[:admin][:email])
    if admin&.authenticate(params[:admin][:password])
      admin_sign_in(admin)
      redirect_to admin_root_path
    else
      render action: :new
    end
  end

  def destroy
    admin_sign_out
    redirect_to new_session_path
  end
end
