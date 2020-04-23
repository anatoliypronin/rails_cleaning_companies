FactoryBot.define do
  factory :client do
    name
    surname
    email
    password { '123456' }
    phone_number
  end
end
