class Transaction < ActiveRecord::Base
  include SafelyDestroyable

  validates :name, presence: true
  has_one :bank_guarantee

  def safe_destroy!
    ActiveRecord::Base.transaction do
      bank_guarantee.safe_destroy!
      super
    end
    true
  end
end
