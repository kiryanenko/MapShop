require 'test_helper'
class UserFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    get "/users/sign_up"
    assert_response :success
    user = { email: 'test@test.ru', password: '12345678', password_confirmation: '12345678' }
    post_via_redirect '/users', :user => user
    get '/user/index'
    assert_equal '/user/index', path
  end
  test "not login and not browse site" do
    get "/users/sign_in"
    assert_response :success
    user = { email: 'error@test.ru', password: 'error'}
    post_via_redirect '/users/sign_in', :user => user
    get '/user/index'
    assert_equal '/unauthenticated', path
  end
end