class ExercisesController < ApplicationController

  def index
    @exercises = current_user.exercises
  end

  def show
    @exercise = Exercise.find(params[:id])
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
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to exercises_path
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name)
    end

end
