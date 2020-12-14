class AddMoreCounterCache < ActiveRecord::Migration[6.0]
  def change
    add_column :howtodos, :comments_count, :integer, null: false, default: 0
    add_column :users, :ratings_count, :integer, null: false, default: 0
    add_column :users, :comments_count, :integer, null: false, default: 0
    add_column :users, :howtodos_count, :integer, null: false, default: 0
  end
end
