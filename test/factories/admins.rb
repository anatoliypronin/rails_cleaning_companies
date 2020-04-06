FactoryBot.define do
  factory :admin do
    name { 'test_name' }
    email { 'test@mail.purmpumpum' }
    password_digest { 'test_password' }
    role { 'admin' }
  end
end
