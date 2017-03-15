require 'rails_helper'

describe "Current user viewing the list of events" do
  before { login_as user }

  let(:user) { create :user, email: "current@user.com" }
  let(:another_user) { create :user, email: "another@user.com"}

  let!(:event1) { create :event, name: "event name 1", user: user }
  let!(:event2) { create :event, name: "event name 2", user: user }
  let!(:event3) { create :event, name: "event name 3", user: another_user }

  it "shows all her events" do
    visit events_path

    expect(page).to have_text("event name 1")
    expect(page).to have_text("event name 2")
  end

  it "Does not show other users events" do
    visit events_path

    expect(page).not_to have_text("event name 3")
  end

end
