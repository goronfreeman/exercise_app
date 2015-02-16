require 'rails_helper'

describe ExercisesController do
  before(:each) do
    user = User.create(email: "foo@bar.com", password: "foobar", password_confirmation: "foobar")
    sign_in(user)
  end

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
