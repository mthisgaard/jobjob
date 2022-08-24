class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user)
    end
  end

  def index?
    record.first.user == user
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
