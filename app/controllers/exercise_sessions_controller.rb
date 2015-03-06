class ExerciseSessionsController < ApplicationController
  def show
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:id])
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.build
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.new(exercise_session_params)

    if @exercise_session.save
      redirect_to exercise_path(@exercise)
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
      redirect_to exercise_path(@exercise)
    else
      render 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = @exercise.exercise_sessions.find(params[:id])
    @exercise_session.destroy

    redirect_to exercise_path(@exercise)
  end

  private

  def exercise_session_params
    params.require(:exercise_session).permit(:set_goal, :rep_goal, :duration_goal, :weight)
  end
end
