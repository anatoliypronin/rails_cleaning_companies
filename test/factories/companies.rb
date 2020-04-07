FactoryBot.define do
  factory :company do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    requisites { "MyText" }
    description { "MyText" }
    rating { 1.5 }
    website { "MyString" }
    phone_number { "MyString" }
  end
end
