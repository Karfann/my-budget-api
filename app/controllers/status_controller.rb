class StatusController < ApplicationController
    before_action :set_status, only: [:show, :update, :destroy]

    #GET /status
    def index
        @status = Status.all
        json_response(@status)
    end

    # POST /status
    def create
        @status = Status.create!(status_params)
        json_response(@status, :created)
    end

    # GET /status/:id
    def show
        json_response(@status)
    end

    # PUT /status/:id
    def update
        @status.update(status_params)
        head :no_content
    end

    # DELETE /status/:id
    def destroy
        @status.destroy
        head :no_content
    end

    private 
        def status_params
            params.permit(:name, :isActive)
        end

        def set_status
            @status = Status.find(params[:id])
        end
end