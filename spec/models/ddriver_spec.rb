require 'rails_helper'

RSpec.describe Ddriver, type: :model do
  let(:ddriver) { Ddriver.create!(first_name: "Elon", last_name: "Musk", active: true) }

  describe '#deactive!' do 
    it "should deactive ddriver" do
      ddriver.deactive!
      expect(ddriver.active).to eq(false)
    end
  end

  describe 'associations' do
    it { should have_many(:orders) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end

