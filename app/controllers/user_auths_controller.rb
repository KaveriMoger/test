class UserAuthsController < ApplicationController

	def index
		@user=UserAuth.all
	end

    def new
     @user = UserAuth.new
    end

    def edit
		@user=UserAuth.find(params[:id])
	end

	def show
		@user=UserAuth.find(params[:id])
	end

    def create
      @user = UserAuth.new(user_params)
     if @user.save
    redirect_to @user, :notice => "succesfully loggedin"
     else
     render "new"
     end
    end

def update
	@user=UserAuth.find(params[:id])
	if @user.update(user_params)
		redirect_to @user
	else
		render 'edit'
	end
end

def destroy
	@user = UserAuth.find(params[:id])
	@user.destroy

	redirect_to users_path
end
   
private

def user_params
	params.require(:user).permit(:username, :email, :password,:password_confirmation)
end

end
