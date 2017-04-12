module SharedHelpers extend RSpec::SharedContext
  let(:transaction) do
    create :transaction
  end

  let(:bank_guaranee) do
    create bank_guaranee, transaction: transaction
  end
end

RSpec.configure do |config|
  config.include SharedHelpers
end
