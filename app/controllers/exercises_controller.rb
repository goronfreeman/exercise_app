class ExercisesController < ApplicationController

  # Creates an index of the signed in user's exercises
  def index
    @exercises = current_user.exercises
  end

  # Shows the details for an individual exercise
  def show
    @exercise = Exercise.find(params[:id])
  end

  # Renders the view for creating a new exercise
  def new
    @exercise = current_user.exercises.build
  end

  # Writes the new exercise to the database
  def create
    @exercise = current_user.exercises.build(exercise_params)

    # Redirects to the index if the save is successful
    if @exercise.save
      redirect_to exercises_path
    # Renders a new view if the save in unsuccessful
    else
      render 'new'
    end
  end

  # Renders the view for editing the name of an exercise
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # Writes the changes to the exercise name to the database
  def update
    @exercise = Exercise.find(params[:id])

    # Redirects to the index if the update is successful
    if @exercise.update(exercise_params)
      redirect_to exercises_path
    # Renders a new edit view if the update is unsuccessful
    else
      render 'edit'
    end
  end

  # Deletes an exercise from the database
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
