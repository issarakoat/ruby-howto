class HomeController < ApplicationController
  def index
    @howtodos = Howtodo.all.limit(3)
    @latest_howtodos = Howtodo.all.limit(3).order(created_at: :desc)
    
    @top_rated_howtodos = Howtodo.order(average_rating: :desc, created_at: :desc).limit(3)
    @popular_howtodos = Howtodo.order(comments_count: :desc, created_at: :desc).limit(3)
  end
  def activity
    @activities = PublicActivity::Activity.all
  end
end
