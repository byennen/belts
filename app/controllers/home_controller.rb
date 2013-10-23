class HomeController < ApplicationController
  before_action :set_cart

  def index
    @default_belt_url = Belt.first.image.url
    @default_buckle_url = Buckle.first.image.url
    @insta_data = HTTParty.get(URI.escape('https://api.instagram.com/v1/tags/c4belts/media/recent?count=2&client_id=16a88a8b1bd2422e81e41eead5717c87'))
  end

  def social
    # https://graph.facebook.com/oauth/access_token?
    # client_id=YOUR_APP_ID&client_secret=YOUR_APP_SECRET&
    # grant_type=client_credentials

    # fb access token: 1426514140896251|V6ejnrjjnb9HrOR4D4LJUNf-Iq8

    @fb_data = HTTParty.get(URI.escape('https://graph.facebook.com/c4belts?fields=feed.limit(5)&access_token=1426514140896251|V6ejnrjjnb9HrOR4D4LJUNf-Iq8'))
    @insta_data = HTTParty.get(URI.escape('https://api.instagram.com/v1/tags/c4belts/media/recent?count=2&client_id=16a88a8b1bd2422e81e41eead5717c87'))
    data = {facebook: @fb_data, instagram: @insta_data}
    render json: data
  end
end
