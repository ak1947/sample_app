require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name: "",
                                       email: "user@invalid",
                                       password: "foo",
                                       password_confirmation: "bar"}}
      end
      assert_template 'users/new'
  end


  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "ak1947", email: "ak.38@qq.com", password: "zong1234", password_confirmation: "zong1234"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
