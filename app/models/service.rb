class Service < ApplicationRecord
  validates :name, length: 5..60 , presence:true
end
