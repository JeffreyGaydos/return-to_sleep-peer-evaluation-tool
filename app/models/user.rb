class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]*[a-z\d\-]\.[a-z]+\z/i }, :uniqueness => { :case_sensitive => false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }

    has_secure_password

    belongs_to :admin, optional: true
    #The following 2 lines are required to set up the many_to_many relationship between Courses and Users
    #uncomment once we have those models present
    has_many :user_course
    has_many :courses, through: :user_course

    #The following 2 lines are required to set up the many_to_many relationship between Teams and Users
    has_many :teams_user
    has_many :teams, through: :teams_user
end
