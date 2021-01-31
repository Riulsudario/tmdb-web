class Profile < ApplicationRecord
  belongs_to :user

  has_many :watchlists
  has_many :watchedlists

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name
end
