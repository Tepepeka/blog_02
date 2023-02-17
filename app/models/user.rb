class User < ApplicationRecord
    has_secure_password
    belongs_to :city
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end