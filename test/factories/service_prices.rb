FactoryBot.define do
  factory :service_price do
    service
    city
    company
    price

    trait :deleted do
      state { 'deleted' }
    end

    trait :active do
      state { 'active' }
    end

    trait :disabled do
      state { 'disabled' }
    end
  end
end
