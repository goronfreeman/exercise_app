class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    puts @exercise.inspect

    if @exercise.save
      redirect_to exercises_path
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name)
    end

end
