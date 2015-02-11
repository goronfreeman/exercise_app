require "rails_helper"

describe ExerciseSessionsController do

  context "#new" do
    before (:each) do
      get :new
    end

    it { should render_template(:new) }
  end
end
