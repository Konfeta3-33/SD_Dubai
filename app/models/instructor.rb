class Instructor < ApplicationRecord
  has_one :user, as: :profile

  accepts_nested_attributes_for :user

  validates :name, :license, :surname, presence: true
  validates :initials, presence: true, length: {maximum: 3}

end
