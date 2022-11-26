class Api::LabelsController < ApplicationController
    before_action :set_label, only: [:show, :update, :destroy]

    def index
        render json: Label.all
    end

    def show
        render json: @label
    end

    def create
        label = Label.new(label_params)

        if label.save
            render json: group
        else
            render json: {errors: group.errors.full_messages}, status: 422
        end
    end

    def update
        if (@label.update(label_params))
            render json: @label
        else
            render json: {errors: @label.errors.full_messages}, status: 422
        end
    end

    def destroy
        @label.destroy
    end

    private

    def set_label
        @label = Label.find(params[:id])
    end

    def group_params
        params.require(:label).permit(:name)
    end

end
