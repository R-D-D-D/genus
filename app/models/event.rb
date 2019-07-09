class Event < ApplicationRecord
	has_many_attached :images
	extend FriendlyId
	friendly_id :title, use: :slugged

	scope :most_recent, -> { order(id: :desc)}
	validates :title , presence: true
	validates :content, presence: true 
	validate :image_type
	
	def should_generate_new_friendly_id?
		title_changed?
	end

	def published_date
		"Published #{created_at.strftime('%-b %-d, %Y')}"
	end

	def resize_image input
		return self.images[input].variant(resize: "200x200!").processed
	end

	def image_type
		images.each do |image|
			if !image.content_type.in?(%('image/jpeg' image/png'))
				errors.add(:images, "not in JPEG or PNG form")
			end
		end
	end
end
