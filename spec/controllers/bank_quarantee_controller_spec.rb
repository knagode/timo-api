describe BankGuaranteesController, type: :controller do
  describe '#destroy' do
    subject do
      delete :destroy, id: bank_guarantee.id
    end

    expect { subject }.to change { bank_guarantee.active }
  end
end
