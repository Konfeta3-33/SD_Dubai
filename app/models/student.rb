class Student < ApplicationRecord
  validates :name, :surname, :email, :phone, presence: true
end
