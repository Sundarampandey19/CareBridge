class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to admin_dashboard_path, notice: "User was successfully created."
      else
        render :new , status: 422
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :name, :age, :role)
    end
  
    def authorize_admin
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
    end
  end
  