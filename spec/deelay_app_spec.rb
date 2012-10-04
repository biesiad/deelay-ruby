require_relative '../lib/deelay'
require 'rspec'
require 'rack/test'

Sinatra::Base.set :environment, :test

describe "DeelayApp" do
  include Rack::Test::Methods

  def app
    Deelay::DeelayApp
  end

  context "when url invalid" do
    it "raise error if protocol missing" do
      expect {
        get "/10?testurl.com"
      }.to raise_error
    end

    it "raise error if protocol missing" do
      expect {
        get "/10?/testurl.com"
      }.to raise_error
    end
  end

  context "when url valid" do
    it "redirects request with port" do
      get "/10?http://testurl.com:1234"
      last_response.status.should == 302
    end

    it "redirects request without port" do
      get "/10?http://testurl.com"
      last_response.status.should == 302
    end

    it "redirects to specified url" do
      get "/10?http://testurl.com"
      last_response.location.should == "http://testurl.com"
    end
  end
end
