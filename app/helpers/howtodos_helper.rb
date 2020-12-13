module HowtodosHelper
  def rate_button(howtodo)
    link_to 'Add rating scope', new_howtodo_rating_path(howtodo_id: @howtodo.id), class: 'btn btn-primary'
    user_howtodo = howtodo.ratings.where(user: current_user)
    if current_user
      if user_howtodo.any?
        link_to 'Thanks for reviewing! Your Review', howtodo_path(howtodo)
      else
        link_to 'Add rating scope after if thing', new_howtodo_rating_path(howtodo_id: @howtodo.id), class: 'btn btn-primary'
      end
    end
  end
end
