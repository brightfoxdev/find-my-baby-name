class Api::UsersController < ApplicationController
    before_action :authenticae_user!

    def update
        if(current_user.update(user_params))
            render json: current_user
        else
            render json: {errors: current_user.errors.full_messages}, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email:, :password, :image)
    end

end
