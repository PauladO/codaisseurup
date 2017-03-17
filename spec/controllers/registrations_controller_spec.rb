require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  def create
    @registration = Registration.new
  end
end
