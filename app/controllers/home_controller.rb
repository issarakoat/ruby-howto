class HomeController < ApplicationController
  def index
    @howtodos = Howtodo.all.limit(3)
    #using scope
    @latest = Howtodo.latest
    @top_rated_howtodos = Howtodo.top_rated_howtodos
    @popular_howtodos = Howtodo.popular_howtodos
  end
  def activity
    @activities = PublicActivity::Activity.all
  end
end
