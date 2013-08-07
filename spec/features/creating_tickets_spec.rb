require "spec_helper"

feature "Creating Tickets" do
  scenario "can create a ticket" do
    visit '/'
    click_link "New Ticket"
    fill_in "Email", with: "user@example.com"
    fill_in "Subject", with: "Cannot Find a Good Restraunt"
    fill_in "Question", with: "Nowhere on the site can I find a good restraunt."
    click_link "Create Ticket"
  end
end
