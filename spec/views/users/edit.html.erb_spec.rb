require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @search = assign(:search, stub_model(User,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@search), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
