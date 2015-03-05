require 'rails_helper'

describe ExercisesController do
  # Sign in user
  before(:each) do
    @user = User.create!(email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
    sign_in(@user)
  end

  # Test index action
  context '#index' do
    before(:each) do
      get :index
    end

    it { should render_template(:index) }
  end

  # Test new action
  context '#new' do
    before(:each) do
      get :new
    end

    it { should render_template(:new) }
  end

  # Test create action
  context '#create' do
    before(:each) do
      @exercise_attr = {
        name: 'test'
      }
    end

    context 'when successful' do
      before(:each) do
        post :create, exercise: @exercise_attr
      end

      it { should redirect_to(exercises_path) }
    end

    context 'when unsuccessful' do
      before(:each) do
        @exercise_attr.merge!(name: nil)

        post :create, exercise: @exercise_attr
      end

      it { should render_template(:new) }
    end
  end

  # Test edit action
  context '#edit' do
    before(:each) do
      @exercise_attr = {
        name: 'test'
      }

      @exercise = @user.exercises.create(@exercise_attr)
      @exercise.save!

      get :edit, id: @exercise.id
    end

    it { should render_template(:edit) }
  end

  # Test update action
  context '#update' do
    before(:each) do
      @exercise_attr = {
        name: 'test'
      }

      @exercise = @user.exercises.create(@exercise_attr)
      @exercise.save!
    end

    context 'when successful' do
      before(:each) do
        @exercise_attr.merge!(name: 'testing')
        put :update, id: @exercise.id, exercise: @exercise_attr
      end

      it { should redirect_to(exercises_path) }
    end

    context 'when unsuccessful' do
      before(:each) do
        @exercise_attr.merge!(name: nil)

        put :update, id: @exercise.id, exercise: @exercise_attr
      end

      it { should render_template(:edit) }
    end
  end

  # Test destroy action
  context '#destroy' do
    before(:each) do
      @exercise_attr = {
        name: 'test'
      }

      @exercise = @user.exercises.create(@exercise_attr)
      @exercise.save!

      delete :destroy, id: @exercise.id, exercise: @exercise_attr
    end

    it { should redirect_to(exercises_path) }
  end
end
