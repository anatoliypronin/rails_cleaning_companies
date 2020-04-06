FactoryBot.define do
  factory :client do
    name { 'MyString' }
    surname { 'MyString' }
    email { 'mymail@mail.ru' }
    password_digest { 'TestPasswordTest' }
    phonenumber { '88005553535' }
  end
end
