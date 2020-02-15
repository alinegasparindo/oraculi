class Experience < ApplicationRecord
  validates :skill, :years_of_experience, presence: true
  validates_uniqueness_of :skill, scope: :user

  belongs_to :user
  belongs_to :skill
end
