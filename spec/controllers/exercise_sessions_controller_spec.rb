require "rails_helper"

describe ExerciseSessionsController do
  # Sign in user
  before(:each) do
    user = User.create!(email: "foo@bar.com", password: "password", password_confirmation: "password")
    sign_in(user)
  end

  # Test new action
  context "#new" do
    before(:each) do
      get :new
    end

    it { should render_template(:new) }
  end

  # Test create action
  context "#create" do
    before(:each) do
      @exercise_session_attr = {
        set_goal: 1,
        rep_goal: 1,
        duration_goal: 1,
        weight: 1
      }
    end

    context "when successful" do
      before(:each) do
        post :create, exercise_session: @exercise_session_attr
      end

      it { should redirect_to(exercises_path) }
    end

    context "when unsuccessful" do
      before(:each) do
        @exercise_session_attr.merge!(set_goal: nil)

        post :create, exercise_session: @exercise_session_attr
      end

      it { should render_template(:new) }
    end
  end
end
