class CreateScheduleMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_movies do |t|
      t.integer :movie_id
      t.string :movie_title
      t.datetime :date
      t.boolean :notification_sent, default: :false
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
