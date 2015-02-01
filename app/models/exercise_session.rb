class ExerciseSession < ActiveRecord::Base
  belongs_to :exercise
  has_many :exercise_sets

  validates :set_goal, presence: true
  validates :set_goal, :rep_goal, :duration_goal, :weight, numericality: true
end
