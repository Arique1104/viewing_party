class RemoveMovieIdFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :movie_id, :integer
  end
end
