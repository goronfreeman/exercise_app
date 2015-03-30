class ExerciseSetsController < ApplicationController
  before_action :find_exercise_and_session, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_exercise_set, only: [:edit, :update, :destroy]

  def find_exercise_and_session
    @exercise = Exercise.find(params[:exercise_id])
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
  end

  def find_exercise_set
    @exercise_set = @exercise_session.exercise_sets.find(params[:id])
  end

  def show
    @exercise_set = ExerciseSet.find(params[:id])
  end

  def new
    @exercise_set = @exercise_session.exercise_sets.build
  end

  def create
    @exercise_set = @exercise_session.exercise_sets.new(exercise_set_params)

    if @exercise_set.save
      redirect_to exercise_exercise_session_path(@exercise, @exercise_session)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @exercise_set.update(exercise_set_params)
      redirect_to exercise_exercise_session_path(@exercise, @exercise_session)
    else
      render 'edit'
    end
  end

  def destroy
    @exercise_set.destroy

    redirect_to exercise_exercise_session_path(@exercise, @exercise_session)
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:reps, :duration)
  end
end
