require 'spec_helper'

describe UsersController do

  let(:valid_attributes) { { "name" => "MyString", email: "user@example.com" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      assigns(:users).should eq([user])
    end
  end

  describe "GET by email or business name" do

    before(:each) do
      User.create()
    end

    it "return the correct number of users" do

      get :index
      response.code.should eq("200")
      result = JSON.parse(response.body)

      result.size.should == 4
    end
  end
end
