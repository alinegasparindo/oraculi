class Skill < ApplicationRecord
  has_many :experiences
  has_many :users, through: :experiences
end
