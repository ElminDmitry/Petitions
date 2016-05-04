class AddGenreColum < ActiveRecord::Migration
  def change
    add_column :petitions, :genre, :string
  end
end
