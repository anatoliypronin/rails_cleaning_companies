class AdminPolicy < ApplicationPolicy
  def index?
    user.role.admin?
  end

  def show?
    user.role.admin? || user.id == record.id
  end

  def create?
    user.role.admin?
  end

  def new?
    create?
  end

  def update?
    user.role.admin? || user.id == record.id
  end

  def edit?
    update?
  end

  def destroy?
    user.role.admin?
  end

  def del?
    user.role.admin?
  end

  def restore?
    user.role.admin?
  end

  def disable?
    user.role.admin?
  end
end
