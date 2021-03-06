class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  #don't need a new? as it inherits to create from the app policy
  def create?
    true
  end

  # don't need an edit? as it inherits from the app policy
  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
