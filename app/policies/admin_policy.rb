# See https://actionpolicy.evilmartians.io/#/writing_policies
class AdminPolicy < ApplicationPolicy

  def index?
    user.admin == true
  end
end
