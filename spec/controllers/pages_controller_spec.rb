require 'spec_helper'

describe PagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'celebrities'" do
    it "returns http success" do
      get 'celebrities'
      response.should be_success
    end
  end

  describe "GET 'retailer'" do
    it "returns http success" do
      get 'retailer'
      response.should be_success
    end
  end

end
