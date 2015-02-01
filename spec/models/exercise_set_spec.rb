require "rails_helper"

describe ExerciseSet do
  it {should validate_numericality_of(:reps)}
  it {should validate_numericality_of(:duration)}
end
