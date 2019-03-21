require 'test_helper'

class ProgressEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get progress_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get progress_entries_create_url
    assert_response :success
  end

  test "should get update" do
    get progress_entries_update_url
    assert_response :success
  end

  test "should get edit" do
    get progress_entries_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get progress_entries_destroy_url
    assert_response :success
  end

end
