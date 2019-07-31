require 'test_helper'

class UpcomingEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upcoming_event = upcoming_events(:one)
  end

  test "should get index" do
    get upcoming_events_url
    assert_response :success
  end

  test "should get new" do
    get new_upcoming_event_url
    assert_response :success
  end

  test "should create upcoming_event" do
    assert_difference('UpcomingEvent.count') do
      post upcoming_events_url, params: { upcoming_event: { content: @upcoming_event.content, date: @upcoming_event.date, title: @upcoming_event.title } }
    end

    assert_redirected_to upcoming_event_url(UpcomingEvent.last)
  end

  test "should show upcoming_event" do
    get upcoming_event_url(@upcoming_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_upcoming_event_url(@upcoming_event)
    assert_response :success
  end

  test "should update upcoming_event" do
    patch upcoming_event_url(@upcoming_event), params: { upcoming_event: { content: @upcoming_event.content, date: @upcoming_event.date, title: @upcoming_event.title } }
    assert_redirected_to upcoming_event_url(@upcoming_event)
  end

  test "should destroy upcoming_event" do
    assert_difference('UpcomingEvent.count', -1) do
      delete upcoming_event_url(@upcoming_event)
    end

    assert_redirected_to upcoming_events_url
  end
end
