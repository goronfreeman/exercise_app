require "rails_helper"

describe ExerciseSession do
  it {should validate_presence_of(:set_goal)}
  it {should validate_numericality_of(:set_goal)}
  it {should validate_numericality_of(:rep_goal)}
  it {should validate_numericality_of(:weight)}
  it {should validate_numericality_of(:duration_goal)}
end
