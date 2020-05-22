module Support
  module Auth
    def sign_in_as_admin(admin)
      post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
    end

    def sign_out_as_admin
      delete admin_session_path
    end

    def sign_in_as_company(company)
      post company_session_path, params: { company: { email: company.email, password: company.password } }
    end

    def sign_in_as_client(client)
      post client_session_path, params: { client: { email: client.email, password: client.password } }
    end

    def sign_out_as_client
      delete client_session_path
    end
  end
end
