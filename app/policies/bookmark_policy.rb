class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def new?
    record.list.user == user
  end

  def create?
    new?
  end

  def destroy?
    record.list.user == user
  end
end
