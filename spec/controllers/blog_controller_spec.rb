require 'spec_helper'

describe BlogController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'post_1'" do
    it "returns http success" do
      get 'post_1'
      response.should be_success
    end
  end

end
