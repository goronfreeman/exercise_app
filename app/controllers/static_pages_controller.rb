class StaticPagesController < ApplicationController

  # Sets the default landing page
  def home
    # Redirects to the index if signed in
    if user_signed_in?
      redirect_to exercises_path
    end
  end
end
