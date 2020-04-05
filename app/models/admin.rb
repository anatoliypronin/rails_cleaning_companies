class Admin < ApplicationRecord
  validates :name, :email, :role, :password_digest, presence: true
  validates :name, length: { maximum: 10 }
  validates :email, uniqueness: true
  validates :email, email: true
  validates :role, inclusion: { in: %w(Admin Editor),
                   message: "%{value} is not Admin or Editor" }
  validates :password_digest, length: { minimum: 6 }
end
