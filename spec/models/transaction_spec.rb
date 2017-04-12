RSpec.describe Transaction, type: :model do
  describe '#safe_destroy!' do
    before do
      transaction # creates it in DB
    end

    subject do
      transaction.safe_destroy!
    end

    expect { subject }.to change { transaction.active }.from(true).to(false)
    expect { subject }.to change { Transaction.all }.by(-1)
    expect { subject }.to change { Transaction.unscoped.all }.by(0)

    context 'when transaction has some bank guarantees' do
      before do
        bank_guarantee # creates it in DB
      end

      expect { subject }.to change { bank_guarantee.active }.from(true).to(false)
      expect { subject }.to change { BankGuarantee.all }.by(-1)
      expect { subject }.to change { BankGuarantee.unscoped.all }.by(0)
    end
  end
end
