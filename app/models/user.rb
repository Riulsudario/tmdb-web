class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :profiles, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :email

  validates_uniqueness_of :email, case_sensitive: true
end
