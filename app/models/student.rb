class Student < ApplicationRecord
  validates :name, :surname, :email, :phone, presence: true

  def full_name = "#{name} #{surname}"
end
