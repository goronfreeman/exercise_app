class ExerciseSetsController < ApplicationController
  def show
    @exercise_set = ExerciseSet.find(params[:id])
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    @exercise_set = @exercise_session.exercise_sets.build
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    @exercise_set = @exercise_session.exercise_sets.build

    if @exercise_set.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def exercise_sets_params
    params.require(:exercise_set).permit(:reps, :duration)
  end
end
