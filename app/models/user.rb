class User < ApplicationRecord
  include PgSearch::Model
  has_many :experiences, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # has_many :availabilities, dependent: :destroy
  has_many :skills, through: :experiences
  has_many :mentor_reviews, foreign_key: 'mentor_id', class_name: 'Review', dependent: :destroy
  has_many :mentee_reviews, foreign_key: 'mentee_id', class_name: 'Review', dependent: :destroy
  has_one_attached :photo
  has_many :mentor_meetings, foreign_key: 'mentor_id', class_name: 'Meeting', dependent: :destroy
  has_many :mentee_meetings, foreign_key: 'mentee_id', class_name: 'Meeting', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  pg_search_scope :search_user_by_skill, associated_against:
    {
      skills: :name
    }, using: {
      tsearch: { prefix: true }
    }
end
