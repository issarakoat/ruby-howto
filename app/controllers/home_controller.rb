class HomeController < ApplicationController
  def index
    @howtodos = Howtodo.all.limit(3)
    @latest_howtodos = Howtodo.all.limit(3).order(created_at: :desc)
  end
  def activity
    @activities = PublicActivity::Activity.all
  end
end
