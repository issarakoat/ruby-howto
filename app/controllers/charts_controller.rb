class ChartsController < ApplicationController

  def users_per_day
    render json: User.group_by_day(:created_at).count
  end

  def comments_per_day
    render json: Comment.group_by_day(:created_at).count
  end

  def ratings_per_day
    render json: Rating.group_by_day(:created_at).count
  end

end 