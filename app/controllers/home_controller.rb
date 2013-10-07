class HomeController < ApplicationController
  def index
    @users = User.all
    @belts = Belt.all
    @buckles = Buckle.all
  end
end
