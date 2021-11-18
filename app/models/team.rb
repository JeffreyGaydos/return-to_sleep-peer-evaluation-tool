class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :needs_eval, presence:true

  after_initialize :set_defaults, unless: :persisted?
  # Initalize needs_eval to false
  def set_defaults
    self.needs_eval = false if self.self.needs_eval.nil?
  end
  # Relations
  # has_and_belongs_to_many :users # many to many users
  # belongs_to :course # In Rails 5, whenever we define a belongs_to association,
                      # it is required to have the associated record present by default after this change.

end
