class ExerciseSessionsController < ApplicationController

  # Renders the form for creating a new exercise session
  def new
    @exercise_session = ExerciseSession.new
  end

  # Writes the new exercise session to the database
  def create
    @exercise_session = ExerciseSession.new(exercise_session_params)

    # Redirects to the index if the save is successful
    if @exercise_session.save
      redirect_to exercises_path
    # Renders a new form if the save is unsuccessful
    else
      render 'new'
    end
  end

  private

    # Strong parameters
    def exercise_session_params
      params.require(:exercise_session).permit(:set_goal, :rep_goal, :duration_goal, :weight)
    end

end
