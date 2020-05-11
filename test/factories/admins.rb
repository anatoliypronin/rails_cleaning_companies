FactoryBot.define do
  factory :admin do
    name
    email
    password
    role { 'admin' }

    trait :deleted do
      state { 'deleted' }
    end

    trait :active do
      state { 'active' }
    end
  end
end
