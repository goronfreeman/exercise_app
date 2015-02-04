require "rails_helper"

describe ExercisesController do
  context "#index" do
    before(:each) do
      get :index
    end

    it { should render_template(:index) }
  end

  context "#new" do
    before(:each) do
      get :new
    end

    it { should render_template(:new) }
  end
end
