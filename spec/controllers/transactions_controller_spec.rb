describe TransactionsController, type: :controller do
  describe '#destroy' do
    subject do
      delete :destroy, id: transaction.id
    end

    expect { subject }.to change { transaction.active }
  end
end
