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

    trait :deleted do
      state { 'deleted' }
    end

    trait :active do
      state { 'active' }
    end
  end
end
