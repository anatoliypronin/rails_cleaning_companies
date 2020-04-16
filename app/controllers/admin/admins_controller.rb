class Admin::AdminsController < Admin::ApplicationController 
    def index
        @admins = Admin.all
    end

    def new
        @admin = Admin.new
    end
end
