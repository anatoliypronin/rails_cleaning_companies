FactoryBot.define do
  sequence :numeric, aliases: [:price] do |n|
    0 + n
  end
end
