FactoryBot.define do
  sequence :numeric, aliases: [:price] do |n|
    0 + n
  end

  sequence :string, aliases: %i[name surname website password_digest title] do |n|
    "teststring#{n}"
  end

  sequence :text, aliases: %i[requisites description short_description] do |n|
    "sometext#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :phone_number do
    "8800#{rand(10**6..10**7)}"
  end
end
