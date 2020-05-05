FactoryBot.define do
  factory :service_price do
    service
    city
    company
    price

    trait :del do
      state { 'deleted' }
    end

    trait :activated do
      state { 'active' }
    end

    trait :disabled do
      state { 'disable' }
    end
  end
end
