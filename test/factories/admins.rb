FactoryBot.define do
  factory :admin do
    name
    email
    password_digest
    role { 'admin' }
    trait :deleted do
      state { deleted }
    end
    trait :activated do
      state { active }
    end
  end
end
