class Experience < ApplicationRecord
  include PgSearch::Model
  validates :skill, :years_of_experience, presence: true
  validates_uniqueness_of :skill, scope: :user
  belongs_to :user
  belongs_to :skill
  pg_search_scope :search_experience_by_skill, associated_against:
    {
      skill: :name
    }, using: {
      tsearch: { prefix: true }
    }
end
