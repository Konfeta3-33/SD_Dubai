class User < ApplicationRecord
  belongs_to :profile, polymorphic: true

  validates :login, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def email_required? = false

  def email_changed? = false

  def will_save_change_to_email? = false
end
