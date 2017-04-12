class Api::V1::BankGuaranteesController < ApplicationController
  before_action :set_bank_guarantee, only: [:show, :update]

  def show
  end

  def create
    @bank_guarantee = BankGuarantee.new(bank_guarantee_params)

    if @bank_guarantee.save
      render_success :created
    else
      render_errors @bank_guarantee.errors
    end
  end

  def update
    if @bank_guarantee.update(bank_guarantee_params)
      render_success
    else
      render_errors @bank_guarantee.errors
    end
  end

  def destroy
    if @bank_guarantee.safe_destroy!
      render_success
    else
      render_errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_guarantee
      @bank_guarantee = BankGuarantee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_guarantee_params
      params.require(:bank_guarantee).permit(:active, :transaction_id)
    end
end
