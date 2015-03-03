# Comment
class ExerciseSessionsController < ApplicationController
  def show
    @exercise_session = ExerciseSession.find(params[:id])
  end

  # Renders the view for creating a new exercise session
  def new
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.build
  end

  # Writes the new exercise session to the database
  def create
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.new(exercise_session_params)

    # Redirects to the index if the save is successful
    if @exercise_session.save
      redirect_to exercises_path
    # Renders a new view if the save is unsuccessful
    else
      render 'new'
    end
  end

  def edit
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.find(params[:id])

    if @exercise_session.update(exercise_session_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.find(params[:id])

    redirect_to exercises_path
  end

  private

  def exercise_session_params
    params.require(:exercise_session).permit(:set_goal, :rep_goal, :duration_goal, :weight)
  end
end
