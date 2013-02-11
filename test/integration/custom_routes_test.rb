require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "that /login route opens the login page" do
  	get '/login'
  	assert_response :success
  end

  test "that /logout routes opens the logout page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  	#we use redirect for response because that is the reponse we get
  end

  test "that /register routes opens the register page" do
  	get '/register'
  	assert_response :success
  	
  end

  test "that a profile page works" do
    get '/adi2412'
    assert_response :success
  end


end
