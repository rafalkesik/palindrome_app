require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def setup
        @base_title = "Learn Enough Ruby Sample App"
    end

    def test_index
        get '/'
        assert last_response.ok?
        assert doc(last_response).at_css('h1')
        assert_equal "#{@base_title} | Home",
                     doc(last_response).at_css('title').content
        assert doc(last_response).at_css('nav')
    end

    def test_about
        get '/about'
        assert last_response.ok?
        assert doc(last_response).at_css('h1')
        assert_equal "#{@base_title} | About",
        doc(last_response).at_css('title').content
    end

    def test_palindrome
        get '/palindrome'
        assert last_response.ok?
        assert doc(last_response).at_css('h1')
        assert_equal "#{@base_title} | Palindrome Detector",
        doc(last_response).at_css('title').content
    end

end
