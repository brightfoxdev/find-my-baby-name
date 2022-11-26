class Api::FriendListsController < ApplicationController
    before_action :set_friend_list, only: [:show, :update, :destroy]

    def index
        render json: Friend_list.all
    end

    def show
        render json: @friend_list
    end

    def create
        friend_list = Friend_list.new(friend_list_params)

        if friend_list.save
            render json: friend_list
        else
            render json: {errors: friend_list.errors.full_messages}, status: 422
        end
    end

    def update
        if (@friend_list.update(friend_list_params))
            render json: @friend_list
        else
            render json: {errors: @friend_list.errors.full_messages}, status: 422
        end
    end

    def destroy
        @friend_list.destroy
    end

    private

    def set_friend_list
        @friend_list = Friend_list.find(params[:id])
    end

    def friend_list_params
        params.require(:friend_list).permit(:user_id)
    end
    
end
