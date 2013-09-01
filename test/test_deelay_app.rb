require 'minitest/autorun'
require 'eventmachine'
require 'sinatra/async/test'

require_relative '../lib/deelay'

Sinatra::Base.set :environment, :test

class TestDeelayApp < MiniTest::Unit::TestCase
  include Sinatra::Async::Test::Methods

  def app
    Deelay::App.new
  end

  def test_redirect_query_with_scheme
      get "/10?http://testurl.com/path"
      em_async_continue
      assert_equal "http://testurl.com/path", last_response.location
      assert_equal 302, last_response.status
  end

  def test_redirect_query_no_scheme
    get "/10?testurl.com/path"
    em_async_continue
    assert_equal "http://testurl.com/path", last_response.location
    assert_equal 302, last_response.status
  end

  def test_redirect_query_with_port
    get "/10?testurl.com:1234/path"
    em_async_continue
    assert_equal "http://testurl.com:1234/path", last_response.location
    assert_equal 302, last_response.status
  end


  def test_redirect_url_with_scheme
    get "/10/http://testurl.com/path"
    em_async_continue
    assert_equal "http://testurl.com/path", last_response.location
    assert_equal 302, last_response.status
  end

  def test_redirect_url_no_scheme
    get "/10/testurl.com/path"
    em_async_continue
    assert_equal "http://testurl.com/path", last_response.location
    assert_equal 302, last_response.status
  end

  def test_redirect_url_with_port
    get "/10/testurl.com:1234"
    em_async_continue
    assert_equal "http://testurl.com:1234", last_response.location
    assert_equal 302, last_response.status
  end

  def test_redirect_url_with_query
    get "/10/http://testurl.com/path?query=param"
    em_async_continue
    assert_equal "http://testurl.com/path?query=param", last_response.location
    assert_equal 302, last_response.status
  end


  def test_no_query
    get "/10"
    assert_raises(ArgumentError) do
      em_async_continue(0.1)
    end
  end

  def test_no_link
    get "/10?"
    assert_raises(ArgumentError) do
      em_async_continue(0.1)
    end
  end
end
