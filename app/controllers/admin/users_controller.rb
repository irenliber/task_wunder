module Admin
  class UsersController < ApplicationController
    def index
      @users = User.without_role(:admin).order(created_at: :desc)
      # flash[:success] = 'Hello'
      # flash[:alert] = 'Hello'
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(post_params)

      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :birth_date, :biography)
    end
  end
end

