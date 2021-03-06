class DeckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  # don't need new as it is passed create in app policy
  # anyone can create a new deck
  def create?
    true
  end

  def create_new_deck_cards?
    true
  end

  def results?
    true
  end

  def show?
    true
  end

  # don't need an edit as update is called by edit in app policy
  # can only edit if you are the user who made the deck, user = current_user, record = @deck
  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
