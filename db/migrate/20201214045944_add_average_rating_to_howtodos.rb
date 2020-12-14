class AddAverageRatingToHowtodos < ActiveRecord::Migration[6.0]
  def change
    add_column :howtodos, :average_rating, :float, default: 0, null: false
  end
end
