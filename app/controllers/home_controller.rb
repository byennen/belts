class HomeController < ApplicationController
  before_action :set_cart
  def index
    @default_belt_url = Belt.first.image.url
    @default_buckle_url = Buckle.first.image.url

  end
end
