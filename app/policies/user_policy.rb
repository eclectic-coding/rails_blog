class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
