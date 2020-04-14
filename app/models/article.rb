class Article < ApplicationRecord
  validates :title, :short_description, :description, presence: true
  validates :title, length: 1..100
end
