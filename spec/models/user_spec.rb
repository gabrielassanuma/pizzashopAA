require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_inside)  { User.create!(phone_number: 999888777, password: 111111, username: "Gabriel", address: "Calçada da Pampulha 27, Lisboa", latitude: 38.7046306, longitude: -9.167364) }
  let(:user_outside) { User.create(phone_number: 999888666, password: 111111, username: "Gabriel1", address: "test", latitude: 37.788022, longitude: -122.399797) }
  
  describe 'distance_from_store' do
    context 'when latitude and longitude are present' do
      it 'adds an error if the distance is greater than 20' do
        user_outside.distance_from_store
        expect(user_outside.errors[:address]).to be_present
      end

      it 'does not add an error if the distance is less than or equal to 20' do
        user_inside.distance_from_store
        expect(user_inside.errors[:address]).to be_empty
      end
    end

    context 'when latitude and longitude are not present' do
      before do
        user_outside.latitude = nil
        user_outside.longitude = nil
      end
      it 'adds an error for invalid address' do
        user_outside.distance_from_store
        expect(user_outside.errors[:address]).to be_present
      end
    end
  end
  
  describe 'associations' do
    it {should have_many(:orders)}
  end
  
  describe 'validations' do
    it { should validate_presence_of(:phone_number) }
    it { should validate_length_of(:phone_number).is_equal_to(9) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:address) }
  end
end

puts ("------------------------------------------------------------------------------------------")