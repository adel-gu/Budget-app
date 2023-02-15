class TransactionsController < ApplicationController
  def index
    @category = Category.includes(:one_transaction).find(params[:category_id])
    @transactions = @category.category_recent_transactions
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: @transaction } }
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      format.html do
        if @transaction.save
          CategoryTransaction.create(one_category: @category, one_transaction: @transaction)
          flash[:sucess] = 'transaction Saved Successfully'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: The New transaction could not be saved'
          render :new, locals: { transaction: @transaction }
        end
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount).merge(author: current_user)
  end
end
