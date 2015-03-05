require 'rails_helper'

describe ExerciseSetsController do
  # Sign in user
  before(:each) do
    @user = User.create!(email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
    sign_in(@user)

  end

  # Test new action
  context '#new' do
    before(:each) do
      @exercise = @user.exercises.create!(name: 'test')
      @exercise.save!

      @exercise_session = @user.exercises.exercise_sessions.create!(name: 'test')
      @exercise_session.save!

      get :new, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id
    end

    it { should render_template(:new) }
  end
end
