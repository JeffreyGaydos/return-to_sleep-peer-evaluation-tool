class Admin < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :institution_id, presence: true
    has_one :user, validate: false, required: true #we don't validate users here because we allow an admin_id of -1 to exist, denoting inauthorized institution
    belongs_to :institution, validate: true, required: true

    has_many :course_admin
    has_many :courses, through: :course_admin

    after_create :update_user

    def update_user
        User.find_by(id: self.user_id).update_attribute(:admin_id, self.id)
    end
end
