class User < ApplicationRecord
    belongs_to :city
    has_many :articles
    has_many :comments, dependent: :destroy
end