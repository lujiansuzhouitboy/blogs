require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :title => "Title",
        :content => "Content",
        :user_id => 1,
        :categories_id => "Categories",
        :status => 2
      ),
      stub_model(Blog,
        :title => "Title",
        :content => "Content",
        :user_id => 1,
        :categories_id => "Categories",
        :status => 2
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Categories".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
