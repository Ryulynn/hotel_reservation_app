class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}
    validates :image, {presence: true}
    validates :comment, {presence: true}
    has_many :rooms, dependent: :destroy
    has_many :reservations, dependent: :destroy
end
