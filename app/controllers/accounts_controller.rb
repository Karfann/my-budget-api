class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :update, :destroy]

    #GET /accounts
    def index
        @accounts = Account.all
        json_response(@accounts)
    end

    # POST /accounts
    def create
        @account = Account.create!(account_params)
        json_response(@account, :created)
    end

    # GET /accounts/:id
    def show
        json_response(@account)
    end

    # PUT /accounts/:id
    def update
        @account.update(account_params)
        head :no_content
    end

    # DELETE /accounts/:id
    def destroy
        @account.destroy
        head :no_content
    end

    # GET /accounts/active
    def active
        @account = Account.only_active
        json_response(@account)
    end

    private 
        def account_params
            params.permit(:name, :balance, :isActive)
        end

        def set_account
            @account = Account.find(params[:id])
        end
end