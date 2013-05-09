require 'spec_helper'

describe "keywords/index" do
  before(:each) do
    assign(:keywords, [
      stub_model(Keyword,
        :site_id => 1,
        :word => "Word"
      ),
      stub_model(Keyword,
        :site_id => 1,
        :word => "Word"
      )
    ])
  end

  it "renders a list of keywords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Word".to_s, :count => 2
  end
end
