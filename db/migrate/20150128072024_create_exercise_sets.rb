class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.references :exercise_session

      t.integer :reps
      t.integer :duration

      t.timestamps
    end
  end
end
