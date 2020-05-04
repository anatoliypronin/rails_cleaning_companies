module Support
  module Auth
    def sign_in_as_admin(admin)
      post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
    end

    def sign_in_as_company(company)
      post session_path, params: { company: { email: company.email, password: company.password } }
    end
  end
end
