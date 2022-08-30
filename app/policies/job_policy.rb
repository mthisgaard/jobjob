class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user).order(:status)
    end
  end

  def index?
    # record.first.user == user
    true
  end

  def create?
    # record.user == user
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    true
  end
end
