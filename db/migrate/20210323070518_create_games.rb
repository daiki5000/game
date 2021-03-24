class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :developer
      t.string :distributor
      t.string :platform
      t.date :release
      t.date :play
      t.date :registration
      t.date :renewal

      t.timestamps
    end
  end
end
