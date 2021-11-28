class Admin < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    has_one :user, validate: true, required: true
end
