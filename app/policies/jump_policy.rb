class JumpPolicy < ApplicationPolicy
  def update? = user.admin? || user.instructor?
end
