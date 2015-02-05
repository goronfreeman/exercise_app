class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :exercise_sessions

  validates :name, presence: true, uniqueness: { scope: :user }
end
