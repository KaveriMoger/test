class UsersController < ApplicationController
  before_action :current_user, :except => [:new, :create]
  before_action :admin_only, :only => [:destroy]
  def index
    @user=User.all
    @user = User.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end
end
