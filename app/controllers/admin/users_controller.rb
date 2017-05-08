module Admin
  class UsersController < ApplicationController

    before_action :protect_admin_panel

    def index
      @users = User.without_role(:admin).order(created_at: :desc)
    end

    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "user_info", :layout => 'pdf.html.haml'
        end
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password, :birth_date, :biography, :avatar)
    end

    def protect_admin_panel
      if user_signed_in?
        unless current_user.has_role?(:admin)
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

  end
end

