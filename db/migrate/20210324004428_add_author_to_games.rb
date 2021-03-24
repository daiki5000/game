class AddAuthorToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :author, :string
  end
end
