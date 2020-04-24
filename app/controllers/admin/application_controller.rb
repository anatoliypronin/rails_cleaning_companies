class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  helper_method :current_admin
end
