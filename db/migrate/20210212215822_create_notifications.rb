class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :message
      t.integer :movie_id
      t.boolean :viewed, null: false, default: false

      t.timestamps
    end
  end
end
