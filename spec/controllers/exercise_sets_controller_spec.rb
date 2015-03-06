require 'rails_helper'

describe ExerciseSetsController do
  # Sign in user, create exercise, create exercise session
  before(:each) do
    @user = User.create!(email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
    sign_in(@user)

    @exercise = @user.exercises.create!(name: 'test')
    @exercise.save!

    @exercise_session = @exercise.exercise_sessions.create!(set_goal: 1, rep_goal: 1, duration_goal: 1, weight: 1)
    @exercise_session.save!
  end

  # Test new action
  context '#new' do
    before(:each) do
      get :new, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id
    end

    it { should render_template(:new) }
  end

  # Test create action
  context '#create' do
    before(:each) do
      @exercise_set_attr = {
        reps: 1,
        duration: nil
      }
    end

    context 'when successful' do
      before(:each) do
        post :create, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id,
                      exercise_set: @exercise_set_attr
      end

      it { should redirect_to(exercise_exercise_session_path(@exercise, @exercise_session)) }
    end

    context 'when unsucessful' do
      before(:each) do
        @exercise_set_attr.merge!(reps: 'a')

        post :create, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id,
                      exercise_set: @exercise_set_attr
      end

      it { should render_template(:new) }
    end
  end

  # Test edit action
  context '#edit' do
    before(:each) do
      @exercise_set_attr = {
        reps: 1,
        duration: nil
      }

      @exercise_set = @exercise_session.exercise_sets.create(@exercise_set_attr)
      @exercise_set.save!

      get :edit, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id, id: @exercise_set.id,
                 exercise_set: @exercise_set_attr
    end

    it { should render_template(:edit) }
  end

  # Test update action
  context '#update' do
    before(:each) do
      @exercise_set_attr = {
        reps: 1,
        duration: nil
      }

      @exercise_set = @exercise_session.exercise_sets.create(@exercise_set_attr)
      @exercise_set.save!

      put :update, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id, id: @exercise_set.id,
                   exercise_set: @exercise_set_attr
    end

    context 'when successful' do
      before(:each) do
        @exercise_set_attr.merge!(reps: 2)

        put :update, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id,
                     id: @exercise_set.id, exercise_set: @exercise_set_attr
      end

      it { should redirect_to(exercise_exercise_session_path(@exercise, @exercise_session)) }
    end

    context 'when unsucessful' do
      before(:each) do
        @exercise_set_attr.merge!(reps: 'a')

        put :update, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id,
                     id: @exercise_set.id, exercise_set: @exercise_set_attr
      end

      it { should render_template(:edit) }
    end
  end

  # Test destroy action
  context '#destroy' do
    before(:each) do
      @exercise_set_attr = {
        reps: 1,
        duration: nil
      }

      @exercise_set = @exercise_session.exercise_sets.create(@exercise_set_attr)
      @exercise_set.save!

      delete :destroy, exercise_id: @exercise.id, exercise_session_id: @exercise_session.id,
                       id: @exercise_set.id, exercise_set: @exercise_set_attr
    end

    it { should redirect_to(exercise_exercise_session_path(@exercise, @exercise_session)) }
  end
end
