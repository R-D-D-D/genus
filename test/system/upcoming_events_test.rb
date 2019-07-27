require "application_system_test_case"

class UpcomingEventsTest < ApplicationSystemTestCase
  setup do
    @upcoming_event = upcoming_events(:one)
  end

  test "visiting the index" do
    visit upcoming_events_url
    assert_selector "h1", text: "Upcoming Events"
  end

  test "creating a Upcoming event" do
    visit upcoming_events_url
    click_on "New Upcoming Event"

    fill_in "Content", with: @upcoming_event.content
    fill_in "Date", with: @upcoming_event.date
    fill_in "Title", with: @upcoming_event.title
    click_on "Create Upcoming event"

    assert_text "Upcoming event was successfully created"
    click_on "Back"
  end

  test "updating a Upcoming event" do
    visit upcoming_events_url
    click_on "Edit", match: :first

    fill_in "Content", with: @upcoming_event.content
    fill_in "Date", with: @upcoming_event.date
    fill_in "Title", with: @upcoming_event.title
    click_on "Update Upcoming event"

    assert_text "Upcoming event was successfully updated"
    click_on "Back"
  end

  test "destroying a Upcoming event" do
    visit upcoming_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Upcoming event was successfully destroyed"
  end
end
