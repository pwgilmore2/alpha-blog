class AddTimestampsToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :biography, :text
    add_column :authors, :updated_at, :datetime
    add_column :authors, :created_at, :datetime
  end
end
