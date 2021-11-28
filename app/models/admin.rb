class Admin < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :institution_id, presence: true
    has_one :user, validate: true, required: true
    belongs_to :institution, validate: true, required: true

    after_create :update_user

    def update_user
        User.find_by(id: self.user_id).update_attribute(:admin_id, self.id)
    end
end
