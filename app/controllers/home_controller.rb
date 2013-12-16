class HomeController < ApplicationController
  before_action :set_cart

  def index
    @default_belt = Belt.order("RANDOM()").first    
    @default_buckle = Buckle.order("RANDOM()").first
    @causes = Cause.active.limit(4)
  end

  def social
    # https://graph.facebook.com/oauth/access_token?
    # client_id=YOUR_APP_ID&client_secret=YOUR_APP_SECRET&
    # grant_type=client_credentials

    # fb access token: 1426514140896251|V6ejnrjjnb9HrOR4D4LJUNf-Iq8

    @fb_data = HTTParty.get(URI.escape('https://graph.facebook.com/c4belts?fields=feed.limit(6)&access_token=1426514140896251|V6ejnrjjnb9HrOR4D4LJUNf-Iq8'))

    unless @fb_data.success?
      fb_token = HTTParty.get(URI.escape('https://graph.facebook.com/oauth/access_token?client_id=1426514140896251&client_secret=9c86ed03194584960800ed2442a7a564&grant_type=client_credentials'))
      @fb_data = HTTParty.get(URI.escape("https://graph.facebook.com/c4belts?fields=feed.limit(6)&access_token=#{fb_token}"))
    end

    @insta_data = HTTParty.get(URI.escape('https://api.instagram.com/v1/tags/c4belts/media/recent?count=6&client_id=16a88a8b1bd2422e81e41eead5717c87'))
    data = {facebook: @fb_data, instagram: @insta_data}
    render json: data
  end
end
