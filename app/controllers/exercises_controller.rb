class ExercisesController < ApplicationController
  before_action :retrieve_exercise, only: [:show, :edit, :update, :destroy]

  def retrieve_exercise
    @exercise = Exercise.find(params[:id])
  end

  def index
    @exercises = current_user.exercises
  end

  def show
  end

  def new
    @exercise = current_user.exercises.build
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)

    if @exercise.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def destroy
    @exercise.destroy

    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
