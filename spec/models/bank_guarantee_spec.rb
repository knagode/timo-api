RSpec.describe BankGuarantee, type: :model do
  describe '#safe_destroy!' do

    subject do
      bank_guarantee.safe_destroy!
    end

    expect { subject }.to change { bank_guarantee.active }.from(true).to(false)
  end
end
