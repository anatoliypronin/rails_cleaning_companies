FactoryBot.define do
  factory :company do
    name
    email
    password_digest
    requisites
    description
    rating { 1.5 }
    website
    phone_number
  end
end
