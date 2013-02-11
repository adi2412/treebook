require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique porfile name" do
  	user = User.new
  	user.profile_name = users(:aditya).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end #not working for some reason.(when using password)

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Aditya', last_name: 'Raisinghani', email: 'aditya12@gmail.com')
    user.password = user.password_confirmation = 'sadf'

    user.profile_name = 'adi1111 with space'

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formattted profile name" do
    user = User.new(first_name: 'Aditya', last_name: 'Raisinghani', email: 'aditya12@gmail.com')
    user.password = 'sadfasdf'
    user.password_confirmation = 'sadfasdf'

    user.profile_name = 'adi1111'
    assert user.valid?
  end


end
