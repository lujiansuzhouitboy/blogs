require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :password => "MyString",
      :status => 1,
      :is_admin => 1,
      :phone => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_status", :name => "user[status]"
      assert_select "input#user_is_admin", :name => "user[is_admin]"
      assert_select "input#user_phone", :name => "user[phone]"
    end
  end
end
