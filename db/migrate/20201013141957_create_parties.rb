class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.integer :movie_id
      t.string :runtime
      t.string :date
      t.string :start_time

      t.timestamps
    end
  end
end
