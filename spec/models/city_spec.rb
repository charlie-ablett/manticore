require 'spec_helper'

describe City do
  before do
    @city = City.new(name: 'Toontown')
  end

  subject { @city }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @city.name = " " }
    it { should_not be_valid }
  end
end
