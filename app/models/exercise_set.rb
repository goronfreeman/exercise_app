class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise_session

  validates :reps, :duration, numericality: true
end
