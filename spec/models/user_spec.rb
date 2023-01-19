require 'rails_helper'

describe 'distance_from_store' do
  before do
    user = User.create!(phone_number: 999888777, password: 111111, username: "Gabriel", address: "Calçada da Pampulha 27, Lisboa", latitude: 38.7046306, longitude: -9.167364)
  end

  context 'when latitude and longitude are present' do
    it 'adds an error if the distance is greater than 20' do
      @user.latitude = 37.788022
      @user.longitude = -122.399797
      @user.distance_from_store
      expect(@user.errors[:address]).to include("Sorry, is too far from store")
    end

    it 'does not add an error if the distance is less than or equal to 20' do
      @user.distance_from_store
      expect(@user.errors[:address]).to be_empty
    end
  end

  context 'when latitude and longitude are not present' do
    before do
      @user.latitude = nil
      @user.longitude = nil
    end
    it 'adds an error for invalid address' do
      @user.distance_from_store
      expect(@user.errors[:address]).to include("Sorry, your address is invalid or can't be find by our system, contact store")
    end
  end
end