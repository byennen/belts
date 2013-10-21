class HomeController < ApplicationController
  before_action :set_cart
  def index
    @users = User.all
    @belts = Belt.all
    @buckles = Buckle.all
  end
end
