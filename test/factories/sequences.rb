FactoryBot.define do
    sequence :numeric, aliases: [:price] do |n|
      0 + n
    end

    sequence :string, aliases: [:name, :surname, :website, :password_digest] do |n|
        "teststring#{n}"
    end

    sequence :text, aliases: [:requisites, :description] do |n|
        "sometext#{n}"
    end

    sequence :email do |n|
        "email-#{n}@email.com"
      end

    sequence :phone_number do |n|
       "8800755355#{n}"
    end
  end