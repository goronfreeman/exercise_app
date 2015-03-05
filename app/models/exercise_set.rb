class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise_session

  validates :exercise_session_id, presence: true
  validates :reps, :duration, numericality: true
end
