class StaticPagesController < ApplicationController

  def home
    @hello = "Hello World!"
  end

end
