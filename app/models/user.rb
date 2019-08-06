class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    validates_confirmation_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_presence_of :name
end
