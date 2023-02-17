class User < ApplicationRecord
    has_secure_password
    belongs_to :city, optional: true
    has_many :articles
    has_many :comments, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end