class Post < ApplicationRecord
	belongs_to :user
	
	has_many :images, as: :imageable, dependent: :destroy

	validates :content, presence: true

	accepts_nested_attributes_for :images

	ATTRIBUTES_PARAMS = [:content, :user_id, images_attributes: [:id, :imageable_id, :imageable_type, :picture]].freeze
end
