class Reply < ActiveRecord::Base
	belongs_to :member
	belongs_to :post
	belongs_to :comment
	has_many :likes, as: :likeable, dependent: :destroy
end