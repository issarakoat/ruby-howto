class AddSlugToHowtodos < ActiveRecord::Migration[6.0]
  def change
    add_column :howtodos, :slug, :string
    add_index :howtodos, :slug, unique: true
  end
end
