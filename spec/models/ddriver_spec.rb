require 'rails_helper'

RSpec.describe Ddriver, type: :model do
  describe '#deactive!' do 
    it "should deactive ddriver" do
      driver = Ddriver.create!(first_name: "Elon", last_name: "Musk", active: true)
      driver.deactive!
      expect(driver.active).to eq(false)
    end
  end
end