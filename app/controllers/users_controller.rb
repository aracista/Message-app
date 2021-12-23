class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "welcome to the Message app #{@user.username}, you have successfully signup"
            redirect_to root_path
        else 
            if @user.errors.any?
                flash[:notice] = @user.errors.full_messages
                # @user.errors.full_messages.each do |msg|
                #     flash[:notice] = msg
                # end
            end
            render 'new'
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully"
            redirect_to @root_path
        else
            render 'edit'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
