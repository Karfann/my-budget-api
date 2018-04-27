class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]

    #GET /transactions
    def index
        @transactions = Transaction.all
        json_response(@transactions)
    end

    # POST /transactions
    def create
        @transaction = Transaction.create!(transaction_params)

        if transaction_params[:account_destiny_id].to_i > 0 
            transaction_params_edit = transaction_params
            transaction_params_edit[:account_id] = transaction_params[:account_destiny_id]
            transaction_params_edit[:amount] = transaction_params[:amount].to_f * -1
            transaction_params_edit[:parent_transaction] = @transaction.id
            Transaction.create!(transaction_params_edit)
        end
         
        json_response(@transaction, :created)
    end

    # GET /transactions/:id
    def show
        json_response(@transaction)
    end

    # PUT /transactions/:id
    def update
        @transaction.update(transaction_params)
        head :no_content
    end

    # DELETE /transactions/:id
    def destroy
        @transaction.destroy
        head :no_content
    end

    private 
        def transaction_params
            params.permit(:date, :description, :note, :amount, :account_id, :status_id, :category_id, :type_id, :account_destiny_id)
        end

        def set_transaction
            @transaction = Transaction.find(params[:id])
        end
end


# TODO: test action duplicate 