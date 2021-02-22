class Profile < ApplicationRecord
  belongs_to :user

  has_many :watchlists, dependent: :destroy
  has_many :watchedlists, dependent: :destroy
  has_many :schedule_movies, dependent: :destroy
  has_many :notifications, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name
end
