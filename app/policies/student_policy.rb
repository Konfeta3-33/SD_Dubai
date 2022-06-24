class StudentPolicy < ApplicationPolicy
  def create? = user.admin? || user.instructor?

  def update? = user.admin? || user.instructor?
end
