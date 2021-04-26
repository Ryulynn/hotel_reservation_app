class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :fee, {presence: true}
  validates :address, {presence: true}
  validates :image, {presence: true}
  belongs_to :user
end
