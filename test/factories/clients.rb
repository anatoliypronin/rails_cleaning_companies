FactoryBot.define do
  factory :client do
    name
    surname
    email
    password_digest
    phone_number
  end
end
