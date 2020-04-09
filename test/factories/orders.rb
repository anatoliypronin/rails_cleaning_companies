FactoryBot.define do
  factory :order do
    status { "accepted" }
    date_start { "Sun, 01 Jan 2012 00:00:00 +0300" }
    date_end { "Sun, 01 Jan 2013 00:00:00 +0300"  }
    review { 1.5 }
  end
end
