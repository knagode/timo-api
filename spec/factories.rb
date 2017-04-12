FactoryGirl.define do

  factory :transaction do
    name "New Transaction"

    trait :inactive do
      active: false
    end
  end

end
