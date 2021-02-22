class Watchlist < ApplicationRecord
  belongs_to :profile

  validates_uniqueness_of :movie_id
end
