require "rails_helper"

describe "log in" do
  let(:user) { create :user }

  it "User log in" do
    visit root_url

  end
end
