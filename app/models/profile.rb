class Profile < ApplicationRecord
  belongs_to :user

  has_many :watchlists
  has_many :watchedlists
  has_many :schedule_movies

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name
end
