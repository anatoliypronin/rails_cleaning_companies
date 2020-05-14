FactoryBot.define do
  factory :order do
    service
    client
    company
    date_start
    date_end
    review

    trait :active do
      state { 'active' }
    end

  end
end
