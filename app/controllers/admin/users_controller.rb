class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    before_action :set_user, only: [:edit, :update, :destroy]

    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to admin_dashboard_path, notice: "User was successfully created."
      else
        render :new , status: :unprocessable_entity
      end
    end
  
    def index
      @users = User.page(params[:page]).per(10) # Fetch all users
    end 

    def edit
      # Renders the edit form
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: "User was successfully deleted."
    end

    private

    def set_user
      @user = User.find(params[:id]) # Find the user by ID
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :name, :age, :role)
    end
  
    def authorize_admin
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
    end
  end
  