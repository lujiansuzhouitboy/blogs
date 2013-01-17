require 'spec_helper'

describe "blogs/new" do
  before(:each) do
    assign(:blog, stub_model(Blog,
      :title => "MyString",
      :content => "MyString",
      :user_id => 1,
      :categories_id => "MyString",
      :status => 1
    ).as_new_record)
  end

  it "renders new blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blogs_path, :method => "post" do
      assert_select "input#blog_title", :name => "blog[title]"
      assert_select "input#blog_content", :name => "blog[content]"
      assert_select "input#blog_user_id", :name => "blog[user_id]"
      assert_select "input#blog_categories_id", :name => "blog[categories_id]"
      assert_select "input#blog_status", :name => "blog[status]"
    end
  end
end
