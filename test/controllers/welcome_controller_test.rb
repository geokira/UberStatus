require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
    test "should get index" do
        get :index
        assert_response :success
        assert_select "title", "Home | Uber Status"
    end

    test "should get contact_us" do
        get :contact_us
        assert_response :success
        assert_select "title", "Contact Us | Uber Status"
    end

end
