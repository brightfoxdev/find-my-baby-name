class Api::NamesController < ApplicationController
    before_action :set_name, only: [:show, :update, :destroy]

    def index
        render json: Name.all
    end

    def show
        render json: @name
    end

    def create
        name = Name.new(name_params)

        if name.save
            render json: name
        else
            render json: {errors: name.errors.full_messages}, status: 422
        end
    end

    def update
        if (@name.update(name_params))
            render json: @name
        else
            render json: {errors: @name.errors.full_messages}, status: 422
        end
    end

    def destroy
        @name.destroy
    end

    private

    def set_name
        @name = Name.find(params[:id])
    end

    def name_params
        params.require(:name).permit(:name, :meaning, :gender)
    end

end
