FactoryBot.define do
  factory :admin do
    name
    email
    password { '123456' }
    role { 'admin' }

    trait :del do
      state { deleted }
    end

    trait :activated do
      state { active }
    end
  end
end
