class Jump < ApplicationRecord
  belongs_to :student
  belongs_to :instructor, optional: true

  enum status: {
    current: 0,
    passed: 1,
    repeat: 2,
    skipped: 3
  }

  validates :instructor, presence: true, if: :completed?

  def completed?
    passed? || repeat?
  end
end
