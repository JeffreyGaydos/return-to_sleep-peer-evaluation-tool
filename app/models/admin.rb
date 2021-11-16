class Admin < ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    has_one :user

    #https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_associated - User Amasses
    #Validates that this object has a valid user before creation
    validate do
      [:user].each do |attr|
        errors.add(attr, "is required") if self.send(attr).nil?
      end
    end
end
