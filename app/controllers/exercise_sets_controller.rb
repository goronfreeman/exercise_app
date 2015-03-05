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
    @exercise_set = @exercise_session.exercise_sets.new(exercise_set_params)

    if @exercise_set.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def edit
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    @exercise_set = @exercise_session.exercise_sets.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    @exercise_set = @exercise_session.exercise_sets.find(params[:id])

    if @exercise_set.update(exercise_set_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    @exercise_set = @exercise_session.exercise_sets.find(params[:id])

    redirect_to exercises_path
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:reps, :duration)
  end
end
