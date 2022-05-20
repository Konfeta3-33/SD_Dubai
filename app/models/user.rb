class User < ApplicationRecord
  belongs_to :profile, polymorphic: true

  # TODO: enable Rails/UniqueValidationWithoutIndex
  validates :login, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
end
