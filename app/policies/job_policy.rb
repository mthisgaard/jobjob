class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user)
    end

    def index?
      jobs.user == user
    end
  end
end
