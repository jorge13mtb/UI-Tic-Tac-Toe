class CreateStatusOfTheGames < ActiveRecord::Migration
  def change
    create_table :status_of_the_games do |t|
      t.string :array
      t.string :current_player

      t.timestamps
    end
  end
end
