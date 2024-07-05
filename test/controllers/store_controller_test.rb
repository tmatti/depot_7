# frozen_string_literal: true

require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get store_index_url
    assert_response :success
    assert_select 'nav a', minimum: 4
    assert_select 'main ul li', minimum: 3
    assert_select 'h2', products(:ruby).title
    assert_select 'div', /\$[,\d]+\.\d\d/
  end
end
