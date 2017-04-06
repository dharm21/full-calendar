class Post < ActiveRecord::Base
	belongs_to :member
	has_many :comments,  dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	has_attached_file :image, styles: { large: "400x400", medium: "200x200>", 
	thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :dislikes, as: :dislikeable
end
