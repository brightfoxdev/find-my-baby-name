class Api::GroupUsersController < ApplicationController
    before_action :set_group_user, only: [:show, :update, :destory]

    def index
        render json: Group_user.all
    end

    def show
        render json: @group_user
    end

    def create
        group_user = Group_user.new(group_user_params)

        if group_user.save
            render json: group_user
        else
            render json: {errors: group_user.errors.full_messages}, status: 422
        end
    end

    def update
        if (@group_user.update(group_user_params))
            render json: @group_user
        else
            render json: {errors: @group_user.errors.full_messages}, status: 422
        end
    end

    def destroy
        @group_user.destroy
    end

    private

    def set_group_user
        @group_user = Group_user.find(params[:id])
    end

    def group_user_params
        params.require(:group_user).permit(:user_id, :group_id, :role)
    end
    
end
