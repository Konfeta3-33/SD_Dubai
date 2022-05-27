class Instructor < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy

  accepts_nested_attributes_for :user, update_only: true

  validates :name, :license, :surname, presence: true
  validates :initials, presence: true, length: { maximum: 3 }
end
