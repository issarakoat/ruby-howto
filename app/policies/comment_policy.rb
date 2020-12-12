class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.user_id == @user.id || @user.has_role?(:super)
  end

  def update?
    @record.user_id == @user.id || @user.has_role?(:super)
  end

  def new?
    #@user.has_role?(:teacher)
  end


  def destroy?
    @record.user_id == @user.id || @user.has_role?(:super)
  end
end
