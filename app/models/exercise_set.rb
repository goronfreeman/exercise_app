class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise_session

  validates :exercise_session_id, presence: true
  validates :reps, :duration, numericality: true, allow_nil: true

  validate :reps_or_duration

  private

  def reps_or_duration
    if [reps, duration].compact.count != 1
      errors.add(:base, 'Enter reps or duration, not both')
    end
  end
end
