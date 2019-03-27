require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get team" do
    get team_url
    assert_response :success
    #assert_select 'title', @base_title
  end

  test "should get dashboard" do
    get dashboard_url
    assert_response :success
  end
end
