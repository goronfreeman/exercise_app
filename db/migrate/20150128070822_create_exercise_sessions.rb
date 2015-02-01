class CreateExerciseSessions < ActiveRecord::Migration
  def change
    create_table :exercise_sessions do |t|
      t.references :exercise

      t.integer :set_goal
      t.integer :rep_goal
      t.integer :duration_goal
      t.decimal :weight
      
      t.timestamps
    end
  end
end
