class Api::OriginsController < ApplicationController
    before_action :set_origin, only: [:show, :update, :destroy]

    def index
        render json: Origin.all
    end

    def show
        render json: @origin
    end

    def create
        origin = Origin.new(origin_params)

        if origin.save
            render json: origin
        else
            render json: {errors: origin.errors.full_messages}, status: 422
        end
    end

    def update
        if (@origin.update(origin_params))
            render json: @origin
        else
            render json: {errors: @origin.errors.full_messages}, status: 422
        end
    end

    def destroy
        @origin.destroy
    end

    private

    def set_origin
        @origin = Origin.find(params[:id])
    end

    def origin_params
        params.require(:origin).permit(:origin)
    end

end
