class Institution < ApplicationRecord
    validates :name_id, presence: true, length: { maximum: 255, minimum: 2 }
end
