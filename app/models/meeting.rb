class Meeting < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'mentor'
  belongs_to :user, class_name: 'User', foreign_key: 'mentee'
end
