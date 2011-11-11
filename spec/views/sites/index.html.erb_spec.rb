require 'spec_helper'

describe "sites/index.html.erb" do
  before(:each) do
    assign(:sites, [
      stub_model(Site),
      stub_model(Site)
    ])
  end

  it "renders a list of sites" do
    render
  end
end
