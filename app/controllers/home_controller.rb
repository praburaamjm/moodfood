class HomeController < ApplicationController
  def index
  end

  def getstarted
  end

  def allusers
  	@users = User.all
  end
end
