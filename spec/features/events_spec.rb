require 'rails_helper'

feature "Events" do

  scenario "User edits an event" do
    Event.create!(
    description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "edit"
    fill_in "Description", with: "My awesome event"
    click_on "Update Event"

    expect(page).to have_content("My awesome event")
    expect(page).to have_no_content("My aweeesome event")
  end


  scenario 'listing events' do
    Event.create!(
      description: "free lunch today - oh and a gschool panel",
    )

    Event.create(
      description: "Ramen festival",
    )

    Event.create(
      description: "This is random text"
)

  visit root_path # when we go to events/index page we expect?
  expect(page).to have_content("free lunch today - oh and a gschool panel")
  expect(page).to have_content("Ramen festival")
  expect(page).to have_content("This is random text")
  end

  scenario 'deleting events' do
    Event.create!(
      description: "I delete"
  )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("I delete") #wants stronger assertion
    expect(page.current_path).to eq(events_path) #but want to show
    end

  scenario 'User can create an event' do
    visit root_path
    click_on "New Event"
    fill_in "Description", with: "My new event"
    click_on "Create Event"

    expect(page).to have_content("My new event")
    end
end
