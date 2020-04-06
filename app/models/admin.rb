class Admin < ApplicationRecord
  validates :name, :email, :role, :password_digest, presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :role, inclusion: { in: %w(admin editor),
                   message: "%{value} is not admin or editor" }
  validates :password_digest, length: { minimum: 6 }
end
