FactoryBot.define do
  factory :company do
    name
    email
    password
    requisites
    description
    rating { 1.5 }
    website
    phone_number

    trait :del do
      state { 'deleted' }
    end

    trait :activated do
      state { 'active' }
    end
  end
end
