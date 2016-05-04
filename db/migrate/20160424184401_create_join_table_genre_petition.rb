class CreateJoinTableGenrePetition < ActiveRecord::Migration
  def change
    create_join_table :genres, :petitions do |t|
      # t.index [:genre_id, :petition_id]
      # t.index [:petition_id, :genre_id]
    end
  end
end
