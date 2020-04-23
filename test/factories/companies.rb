FactoryBot.define do
  factory :company do
    name
    email
    password { '123456' }
    requisites
    description
    rating { 1.5 }
    website
    phone_number
  end
end
