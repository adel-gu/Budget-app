class TransactionsController < ApplicationController
  def index
    @category = Category.includes(:transactions).find(params[:category_id])
    @transactions = @category.category_recent_transactions
  end

  def new
    @transaction = Transaction.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: @transaction } }
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      format.html do
        if @transaction.save
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
    params.require(:transaction).permit(:name, :amount, :category_id).merge(author: current_user)
  end
end
