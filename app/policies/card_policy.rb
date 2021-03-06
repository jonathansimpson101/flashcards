class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  #don't need a new? as it inherits to create from the app policy
  def create?
    true
  end

  # don't need an edit? as it inherits from the app policy
  def update?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id
  end
end
