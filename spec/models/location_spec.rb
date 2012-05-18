require 'spec_helper'

describe Location do

  let(:location) { create(:location) }

  context "finder" do
    it "should find distinct cometogethers" do
      5.times.each { |n| create(:event, location: location) }
      Location.cometogether.all.should have(1).things
    end
  end
end
