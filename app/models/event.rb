class Event < ApplicationRecord
	acts_as_taggable
	has_many_attached :images
	has_many_attached :videos
	extend FriendlyId
	friendly_id :title, use: :slugged

	scope :most_recent, -> { order(published_at: :desc)}
	scope :published, -> { where(published: true)}
	validates :title , presence: true
	validates :content, presence: true 
	validate :image_type
	
	def should_generate_new_friendly_id?
		title_changed?
	end

	def published_date
<<<<<<< HEAD
		"Published #{created_at.strftime('%-b %-d, %Y')}"
=======
		if(published) 
			"Published #{published_at.strftime('%-b %-d, %Y')}"
		else
			"Not published yet"
		end
>>>>>>> 86ddef1f18b44018d45df7829d08253d99e0f955
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
