class Message < ApplicationRecord
    # attr_accessor :name, :email, :message_body
    validates_presence_of :name, :email, :message_body

    default_scope { order(created_at: :desc) }
    # scope :latest, -> { order(created_at: :desc)}
end
