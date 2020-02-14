class User < ApplicationRecord
  has_many :experiences, dependent: :destroy
  # has_many :availabilities, dependent: :destroy
  has_many :skills, through: :experiences
  has_one_attached :photo
  has_many :mentor_meetings, foreign_key: 'mentor_id', class_name: 'Meeting', dependent: :destroy
  has_many :mentee_meetings, foreign_key: 'mentee_id', class_name: 'Meeting', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
