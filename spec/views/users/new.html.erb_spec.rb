require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :password => "MyString",
      :status => 1,
      :is_admin => 1,
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_status", :name => "user[status]"
      assert_select "input#user_is_admin", :name => "user[is_admin]"
      assert_select "input#user_phone", :name => "user[phone]"
    end
  end
end
