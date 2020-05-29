class Web::ApplicationController < ApplicationController
  layout 'welcome/application'
<<<<<<< HEAD
  helper_method %i[current_client client_sign_in? current_company company_sign_in?]
=======
  helper_method %i[current_client client_sign_in?]
>>>>>>> develop
end
