require 'rails_helper'

describe ExerciseSet do
  it { should validate_presence_of(:exercise_session_id) }
  it { should validate_numericality_of(:reps) }
  it { should validate_numericality_of(:duration) }
end
