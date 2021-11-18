class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]*[a-z\d\-]\.[a-z]+\z/i }, :uniqueness => { :case_sensitive => false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }

    has_secure_password

    #uncomment once we have those models present
    #has_and_belongs_to_many :courses 
    has_and_belongs_to_many :teams
end
