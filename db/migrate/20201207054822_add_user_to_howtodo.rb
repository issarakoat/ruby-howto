class AddUserToHowtodo < ActiveRecord::Migration[6.0]
  def change
    add_reference :howtodos, :user, null: false, foreign_key: true
  end
end
