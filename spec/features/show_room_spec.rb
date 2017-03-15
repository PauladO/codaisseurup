require 'rails_helper'

describe "Viewing and individual event" do
  let(:event) { create :event }

  it "shows the event's details" do
      visit event_path(event)

      expect(page).to have_text(event.name)
      expect(page).to have_text(event.description)
      expect(page).to have_text(event.location)
      expect(page).to have_text("Price: #{event.price}")
      expect(page).to have_text(event.name)
  end
end
