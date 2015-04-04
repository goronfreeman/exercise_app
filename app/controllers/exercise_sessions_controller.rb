class ExerciseSessionsController < ApplicationController
  before_action :retrieve_exercise
  before_action :retrieve_session, only: [:edit, :update, :destroy]

  def retrieve_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end

  def retrieve_session
    @exercise_session = @exercise.exercise_sessions.find(params[:id])
  end

  def show
    @exercise_session = ExerciseSession.find(params[:id])
  end

  def new
    @exercise_session = @exercise.exercise_sessions.build
  end

  def create
    @exercise_session = @exercise.exercise_sessions.new(exercise_session_params)

    if @exercise_session.save
      redirect_to exercise_path(@exercise)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @exercise_session.update(exercise_session_params)
      redirect_to exercise_path(@exercise)
    else
      render 'edit'
    end
  end

  def destroy
    @exercise_session.destroy

    redirect_to exercise_path(@exercise)
  end

  private

  def exercise_session_params
    params.require(:exercise_session).permit(:set_goal, :rep_goal, :duration_goal, :weight)
  end
end
