class HomeController < ApplicationController
  def index
    @howtodos = Howtodo.all.limit(3)
    #using scope
    @latest = Howtodo.latest
    @top_rated_howtodos = Howtodo.top_rated_howtodos
    @popular_howtodos = Howtodo.popular_howtodos
  end
  
  def activity
    # @activities = PublicActivity::Activity.all
    if current_user.has_role?(:admin) || current_user.has_role?(:super)
      @activities = PublicActivity::Activity.all
    else
      redirect_to root_path, alert: "You are not authorized to access this page"
    end
  end
 
  def analytics
    if current_user.has_role?(:admin) || current_user.has_role?(:super)
      # @users = User.all
      # @comments = Comment.all
      # @ratings = Rating.all
    else
      redirect_to root_path, alert: "You are not authorized to access this page"
    end
  end
end
