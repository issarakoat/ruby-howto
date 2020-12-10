class HowtodoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def edit?
    @user.has_role?:super 
    @user.has_role?:admin 
  end
end
