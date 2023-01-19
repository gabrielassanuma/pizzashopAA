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
  end

end