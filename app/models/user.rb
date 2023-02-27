class User < ApplicationRecord

    def remember(remember_token)
        remember_digest = BCrypt::Password.create(remember_token)
        self.update(remember_digest: remember_digest)
        #puts self.inspect
    end

    has_secure_password
    belongs_to :city
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
end