FactoryBot.define do
  factory :admin do
    name
    email
    password_digest
    role { 'admin' }
  end
end
