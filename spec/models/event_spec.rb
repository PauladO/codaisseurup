require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without a description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid when the description is longer than 500 characters" do
      event = Event.new(description: "a"* 501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
  end

  describe "event is free" do
    it "returns true if event is free"  do
      free_event = Event.new(price: 0)
      expect(free_event.is_free?).to eq(true)
    end

    it "returns false if event is free"  do
      event = Event.new(price: 1)
      expect(event.is_free?).to eq(false)
    end
  end

  describe "ordered by price" do
    let!(:free_event) { create :event, price: 0}
    let!(:cheap_event) { create :event, price: 20 }
    let!(:expensive_event) { create :event, price: 200 }

    it "returns true if events are ordered by price" do
      expect(Event.order_by_price).to eq([free_event, cheap_event, expensive_event])
    end
  end

  describe "association to a user" do
    let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.new(name: "event1")
      expect(event.user).to eq(user)
    end

  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@mail.com" }
    let(:host_user) { create :user, email: "host@mail.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end

end
