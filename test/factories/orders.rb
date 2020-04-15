FactoryBot.define do
  factory :order do
    service
    client
    company
    date_start
    date_end
    review
  end
end
