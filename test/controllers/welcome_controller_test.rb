require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
    test "should get index" do
        get :index
        assert_response :success
    end

    test "should get contact_us" do
        get :contact_us
        assert_response :success
    end

end
