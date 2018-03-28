class TypesController < ApplicationController
    before_action :set_type, only: [:show, :update, :destroy]

    #GET /types
    def index
        @types = Type.all
        json_response(@types)
    end

    # POST /types
    def create
        @type = Type.create!(type_params)
        json_response(@type, :created)
    end

    # GET /types/:id
    def show
        json_response(@type)
    end

    # PUT /types/:id
    def update
        @type.update(type_params)
        head :no_content
    end

    # DELETE /types/:id
    def destroy
        @types.destroy
        head :no_content
    end

    private 
        def type_params
            params.permit(:name, :isActive, :value, :isSingleAction)
        end

        def set_type
            @types = Type.find(params[:id])
        end
end