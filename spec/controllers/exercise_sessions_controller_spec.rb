require "rails_helper"

describe ExerciseSessionsController do
  # Sign in user
  before(:each) do
    @user = User.create!(email: "foo@bar.com", password: "password", password_confirmation: "password")
    sign_in(@user)
  end

  # Test new action
  context "#new" do
    before(:each) do
      @exercise = @user.exercises.create!(name: "test")
      @exercise.save!

      get :new, exercise_id: @exercise.id
    end

    it { should render_template(:new) }
  end

  # Test create action
  context "#create" do
    # Create exercise
    before(:each) do
      @exercise = @user.exercises.create!(name: "test")
      @exercise.save!

      @exercise_session_attr = {
        set_goal: 1,
        rep_goal: 1,
        duration_goal: 1,
        weight: 1
      }
    end

    context "when successful" do
      before(:each) do
        post :create, exercise_id: @exercise.id, exercise_session: @exercise_session_attr
      end

      it { should redirect_to(exercises_path) }
    end

    context "when unsuccessful" do
      before(:each) do
        @exercise_session_attr.merge!(set_goal: nil)

        post :create, exercise_id: @exercise.id, exercise_session: @exercise_session_attr
      end

      it { should render_template(:new) }
    end
  end

  # Test edit action
  context "#edit" do
    # Create exercise
    before(:each) do
      @exercise = @user.exercises.create!(name: "test")
      @exercise.save!

      @exercise_session_attr = {
        set_goal: 1,
        rep_goal: 1,
        duration_goal: 1,
        weight: 1
      }

      @exercise_session = @exercise.exercise_sessions.create(@exercise_session_attr)
      @exercise_session.save!

      get :edit, exercise_id: @exercise.id, id: @exercise_session.id
    end

    it { should render_template(:edit) }
  end
end
