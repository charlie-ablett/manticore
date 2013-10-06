require 'spec_helper'

describe User do

  before do
    @search = User.new(name: "Example User", email: "user@example.com")
  end

  subject { @search }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @search.name = " " }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @search.email = ' '}
    it { should_not be_valid}
  end

  describe "when name is too long" do
    before { @search.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @search.email = invalid_address
        expect(@search).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @search.email = valid_address
        expect(@search).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @search.dup
      user_with_same_email.email = @search.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

end