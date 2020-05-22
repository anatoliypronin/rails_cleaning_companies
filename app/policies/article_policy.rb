class ArticlePolicy < ApplicationPolicy
  def update?
    user.role.admin? || user.id == record.admin_id
  end

  def edit?
    update?
  end

  def destroy?
    user.role.admin? || user.id == record.admin_id
  end
end
