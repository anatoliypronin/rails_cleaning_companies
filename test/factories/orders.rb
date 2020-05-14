FactoryBot.define do
  factory :order do
    service_price
    client
    date_start
    date_end
    review
    price

    trait :active do
      state { 'active' }
    end
  end
end
