FactoryBot.define do
  factory :company do
    name { "MyString" }
    email { "test@mail.ru" }
    password_digest { "MyString" }
    requisites { "MyText" }
    description { "MyText" }
    rating { 1.5 }
    website { "MyString" }
    phone_number { "88007773555" }
  end
end
