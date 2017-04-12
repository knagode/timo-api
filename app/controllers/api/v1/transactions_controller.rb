class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy, :term_types]

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render_success :created
    else
      render_errors @transaction.errors
    end
  end

  def update
    if @transaction.update(transaction_params)
      render_errors @transaction.errors
    else
      render_success
    end
  end

  def destroy
    if @transaction.safe_destroy!
      render_success
    else
      render_errors @transaction.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name,:importer_id,:exporter_id, :status)
    end
end
