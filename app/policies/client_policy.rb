class ClientPolicy < ApplicationPolicy
  def show?
    user.role.admin?
  end

  def update?
    user.role.admin?
  end

  def edit?
    update?
  end
end
