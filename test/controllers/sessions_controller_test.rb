# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should prompt for login' do
    get login_url
    assert_response :success
  end

  test 'should login' do
    tim = users(:two)
    post login_url params: { name: tim.name, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal tim.id, session[:user_id]
  end

  test 'should fail login' do
    tim = users(:two)
    post login_url params: { name: tim.name, password: 'wrong' }
    assert_redirected_to login_url
  end

  test 'should logout' do
    delete logout_url
    assert_redirected_to store_index_url
    assert session[:user_id].nil?
  end
end
