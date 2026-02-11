class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
