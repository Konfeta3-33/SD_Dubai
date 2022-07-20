class Student < ApplicationRecord
  validates :name, :surname, :email, :phone, presence: true
  has_many :jumps, dependent: :restrict_with_error
  has_many :instructors, -> { distinct }, through: :jumps
  after_create :init_logbook

  def full_name
    "#{name} #{surname}"
  end

  private

  def init_logbook
    Logbook.new(self).init!
  end
end
