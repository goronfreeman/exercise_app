class ExerciseSession < ActiveRecord::Base
  belongs_to :exercise
  has_many :exercise_sets

  validates :exercise_id, presence: true
  validates :set_goal, presence: true, numericality: true
  validates :rep_goal, numericality: true, unless: 'rep_goal.nil?'
  validates :duration_goal, numericality: true, unless: 'duration_goal.nil?'
  validates :weight, numericality: true, unless: 'weight.nil?'
end
