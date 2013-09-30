require 'spec_helper'

describe Country do
  before do
    @country = Country.new(name: 'Japan')
  end

  subject { @country }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @country.name = " " }
    it { should_not be_valid }
  end

end
