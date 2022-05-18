class Instructor < ApplicationRecord
  has_one :user, as: :profile

  validates :name, :license, :surname, presence: true
  validates :initials, presence: true, length: {maximum: 3}
end
