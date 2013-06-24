class HomeController < ApplicationController
  def index
    @users = User.all
    @decisions = Decision.all
  end
end
