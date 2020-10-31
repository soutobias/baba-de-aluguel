class ServicePolicy < ApplicationPolicy
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

  def index_user?
    true
  end

  def index_babysitter?
    true
  end
end
