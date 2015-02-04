class ExerciseSessionsController < ApplicationController

  def new
    @exercise_session = ExerciseSession.new
  end

  def create
    @exercise_session = ExerciseSession.new(exercise_session_params)

    if @exercise_session.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  private

    def exercise_session_params
      params.require(:exercise_session).permit(:set_goal, :rep_goal, :duration_goal, :weight)
    end

end
