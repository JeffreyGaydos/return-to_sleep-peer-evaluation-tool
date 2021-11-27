class Admin < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :institution_id, presence: true
    has_one :user, validate: true, required: true
    belongs_to :institution, validate: true, required: true
end
