require 'spec_helper'

describe "keywords/show" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :site_id => 1,
      :word => "Word"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Word/)
  end
end
