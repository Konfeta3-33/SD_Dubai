class Instructor < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
  has_many :jumps, dependent: :restrict_with_error
  has_many :students, -> { distinct }, through: :jumps

  accepts_nested_attributes_for :user, update_only: true

  validates :name, :license, :surname, presence: true
  validates :initials, presence: true, length: { maximum: 3 }
end
