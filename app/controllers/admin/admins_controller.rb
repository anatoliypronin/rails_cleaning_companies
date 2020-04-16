class Admin::AdminsController < Admin::ApplicationController 
    def index
        @admins = Admin.all
    end

    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admins_attrs)
        if @admin.save
            redirect_to action: :index
        else
            render action: :new
        end    
    end

    def show
        @admin = Admin.find(params[:id])
    end

    private

    def admins_attrs
        params.require(:admin).permit(:name, :email, :password_digest, :role)
    end
end
