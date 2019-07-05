class Event < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	scope :most_recent, -> { order(id: :desc)}
	validates :title , presence: true
	validates :content, presence: true 

	def should_generate_new_friendly_id?
		title_changed?
	end

	def published_date
		"Published #{created_at.strftime('%-b %-d, %Y')}"
	end
end
