require "spec_helper"

feature "Creating Tickets" do
  scenario "can create a ticket" do
    visit '/'
    click_link "New Ticket"
    fill_in "Email", with: 
  end
end
