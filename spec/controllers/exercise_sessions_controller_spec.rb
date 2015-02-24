require "rails_helper"

describe ExerciseSessionsController do
  before(:each) do
    user = User.create!(email: "foo@bar.com", password: "password", password_confirmation: "password")
    sign_in(user)
  end

  context "#new" do
    before (:each) do
      get :new
    end

    it { should render_template(:new) }
  end
end
