class BabysitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    true
  end

  def update?
    edit?
  end

  def show?
    true
  end

  def destroy?
    true
  end

end
