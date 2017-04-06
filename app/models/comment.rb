class Comment < ActiveRecord::Base
	has_many :replies, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	belongs_to :post
	mount_uploader :image, ImageUploader
end
