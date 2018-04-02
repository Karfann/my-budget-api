class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    #GET /categories
    def index
        @category = Category.all
        json_response(@category)
    end

    # POST /categories
    def create
        @category = Category.create!(category_params)
        json_response(@category, :created)
    end

    # GET /categories/:id
    def show
        json_response(@category)
    end

    # PUT /categories/:id
    def update
        @category.update(category_params)
        head :no_content
    end

    # DELETE /categories/:id
    def destroy
        @category.destroy
        head :no_content
    end

    # GET /categories/active
    def active
        @category = Category.only_active
        json_response(@category)
    end

    private 
        def category_params
            params.permit(:name, :isActive)
        end

        def set_category
            @category = Category.find(params[:id])
        end
end