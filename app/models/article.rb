class Article < ApplicationRecord
  validates :title, :description, :body, presence: true 
  validates :title, length: 1..100
  validates :description, length: 1..500
end
