class Team < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 255 }

  # Set needs eval to false and checks if its false or true
  attribute :needs_eval, :boolean, default: -> { false }
  validates :needs_eval, inclusion: { in: [ true, false ] }
  #after_initialize :set_defaults, unless: :persisted?
  # Initalize needs_eval to false
=begin
  def set_defaults
    self.needs_eval = false if self.self.needs_eval.nil?
  end
=end
  # Relations
  belongs_to :course # In Rails 5, whenever we define a belongs_to association,
  # it is required to have the associated record present by default after this change.

  #The following 2 lines are required to set up the many_to_many relationship between Teams and Users
  has_many :teams_users
  has_many :users, through: :teams_users

end
