class Instructor < ApplicationRecord
  has_one :user, as: :profile

  validates :name, :license, :surname, :initials, presence: true, length: {minimum: 2}
end
